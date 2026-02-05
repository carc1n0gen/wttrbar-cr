require "option_parser"

require "./lang"

module Wttrbar::CLI
  struct Options
    property main_indicator : String = ""
    property location : String = ""
    property vertical_view : Bool = false
    property ampm : Bool = false
    property nerd : Bool = false
    property fahrenheit : Bool = false
    property mph : Bool = false
    property lang : String = "en"
  end

  def self.parse_args(args : Array(String)) : Options
    options = Options.new
    OptionParser.parse(args) do |parser|
      parser.banner = "Usage: wttrbar [options]"
      parser.on("--indicator=INDICATOR", "Set the main weather indicator (default: temp_C or temp_F based on --fahrenheit flag)") { |indicator| options.main_indicator = indicator }
      parser.on("--location=LOCATION", "Specify the location for weather data") { |location| options.location = location }
      parser.on("--vertical-view", "Use vertical view mode") { options.vertical_view = true }
      parser.on("--ampm", "Use 12-hour format with AM/PM") { options.ampm = true }
      parser.on("--nerd", "Use nerd icons for weather symbols") { options.nerd = true }
      parser.on("--fahrenheit", "Use Fahrenheit for temperature") { options.fahrenheit = true }
      parser.on("--mph", "Use miles per hour for wind speed") { options.mph = true }
      parser.on("--lang=LANG", "Set the language for output (default: en)") { |lang| options.lang = lang.upcase }
      parser.on("-h", "--help", "Show this help message") do
        puts parser
        exit
      end
    end

    options
  end
end
