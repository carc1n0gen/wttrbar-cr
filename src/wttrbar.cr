require "json"
require "http/client"

require "./cli"
require "./constants"

module Wttrbar
  VERSION = "0.1.0"

  def self.run
    options = CLI.parse_args(ARGV)
    location = options.location
    lang = Localization::Lang.parse(options.lang) rescue Localization::Lang::EN
    attempts = 0
    max_attempts = 20

    puts({ tooltip: "Loading...", class: "loading", text: "⏳" }.to_json)

    cache_file = "/tmp/wttrbar-#{location}-#{lang}.json"
    is_cache_recent = begin
      if File.exists?(cache_file)
        mtime = File.info(cache_file).modification_time
        (Time.local - mtime) < Time::Span.new(seconds: 600) # is it less than 10 minutes old
      else
        false
      end
    end

    weather = if is_cache_recent
      JSON.parse(File.read(cache_file))
    else
      loop do
        begin
          res = HTTP::Client.get("https://#{lang.wttr_subdomain}/#{location}?format=j1")
          begin
            json = JSON.parse(res.body)
            File.write(cache_file, res.body)
            break json
          rescue parse_exception
            puts({ text: "⛓️‍💥", class: "error", tooltip: "Invalid wttr.in response" }.to_json)
            exit 0
          end
        rescue http_exception
          attempts += 1
          if attempts <= max_attempts
            sleep 0.5 * attempts
          else
            puts({ text: "⛓️‍💥", class: "error", tooltip: "Cannot access wttr.in" }.to_json)
            exit 0
          end
        end
      end
    end

    current_condition = weather["current_condition"][0]
    observation_time = Time.parse(current_condition["localObsDateTime"].as_s, "%Y-%m-%d %I:%M %p", Time::Location.local)
    weather_desc = current_condition["weatherDesc"][0]["value"]
    weather_icons = options.nerd ? Constants::WEATHER_ICONS_NERD : Constants::WEATHER_ICONS
    weather_code = current_condition["weatherCode"]
    feels_like = options.fahrenheit ? current_condition["FeelsLikeF"] : current_condition["FeelsLikeC"]
    temperature = options.fahrenheit ? current_condition["temp_F"] : current_condition["temp_C"]
    wind_speed = options.mph ? current_condition["windspeedMiles"] : current_condition["windspeedKmph"]
    nearest_area = weather["nearest_area"][0]

    data = Hash(String, String).new
    data["text"] = begin
      if options.main_indicator.empty?
        indicatorKey = options.fahrenheit ? "temp_F" : "temp_C"
      else
        indicatorKey = options.main_indicator
      end
      indicator = current_condition[indicatorKey]

      "#{weather_icons[weather_code]} #{indicator}"
    end

    tooltip = "<b>#{current_condition[lang.weather_desc][0]["value"]}</b> #{temperature}°\n"
    tooltip += "#{lang.feels_like}: #{feels_like}°\n"
    tooltip += "#{lang.wind}: #{wind_speed} #{options.mph ? "mph" : "km/h"}\n"
    tooltip += "#{lang.humidity}: #{current_condition["humidity"]}%\n"
    tooltip += "#{lang.location}: #{nearest_area["areaName"][0]["value"]}, #{nearest_area["region"][0]["value"]}, #{nearest_area["country"][0]["value"]}\n"
    tooltip += "#{lang.observation_time}: #{options.ampm ? observation_time.to_s("%I:%M %p") : observation_time.to_s("%H:%M")}\n"

    today = Time.local
    forecast = weather["weather"].as_a.select do |day|
      day_date = Time.parse(day["date"].as_s, "%Y-%m-%d", Time::Location.local)
      day_date >= today.at_beginning_of_day
    end

    forecast.each_with_index do |day, idx|
      tooltip += "\n<b>"

      if idx == 0
        tooltip += "#{lang.today}, "
      elsif idx == 1
        tooltip += "#{lang.tomorrow}, "
      end
    
      tooltip += "#{day["date"]}</b>\n"

      max_temp, min_temp = if options.fahrenheit
        [day["maxtempF"], day["mintempF"]]
      else
        [day["maxtempC"], day["mintempC"]]
      end

      tooltip += begin
        if options.nerd
          "󰳡 #{max_temp}° 󰳛 #{min_temp}° "
        else
          "⬆️ #{max_temp}° ⬇️ #{min_temp}° "
        end
      end

      sunrise, sunset = begin
        if options.ampm
          [day["astronomy"][0]["sunrise"], day["astronomy"][0]["sunset"]]
        else
          [day["astronomy"][0]["sunrise"], day["astronomy"][0]["sunset"]].map do |time|
            Time.parse(time.as_s, "%I:%M %p", Time::Location.local).to_s("%H:%M")
          end
        end
      end
      tooltip += options.nerd ? "󰖜 #{sunrise} 󰖛 #{sunset}\n" : "🌅 #{sunrise} 🌇 #{sunset}\n"

      day["hourly"].as_a.each do |hour|
        hour_time = begin
          time = hour["time"].as_s.gsub("00", "")
          if options.ampm
            Time.parse(time, "%H", Time::Location.local).to_s("%I %p")
          else
            Time.parse(time, "%H", Time::Location.local).to_s("%H:%M")
          end
        end
        hour_icon = weather_icons[hour["weatherCode"]]
        hour_temp = options.fahrenheit ? hour["tempF"] : hour["tempC"]
        hour_feels_like = options.fahrenheit ? hour["FeelsLikeF"] : hour["FeelsLikeC"]
        hour_desc = hour[lang.weather_desc][0]["value"]
        tooltip += "#{hour_time} #{hour_icon} #{hour_temp}° / #{hour_feels_like}° #{hour_desc}\n"
      end
    end

    data["tooltip"] = tooltip
    data["class"] = weather_desc.as_s.downcase.split(",")[0].strip.gsub(" ", "_")
    puts data.to_json
  end
end

Wttrbar.run
