module Wttrbar::Localization
  enum Lang
    EN
    DE
    PL
    RU
    TR
    FR
    BE
    ZH
    ES
    PT
    IT
    JA
    UK
    SV

    def wttr_subdomain : String
      case self
      when EN then "wttr.in"
      when DE then "de.wttr.in"
      when PL then "pl.wttr.in"
      when RU then "ru.wttr.in"
      when TR then "tr.wttr.in"
      when FR then "fr.wttr.in"
      when BE then "be.wttr.in"
      when ZH then "zh.wttr.in"
      when ES then "es.wttr.in"
      when PT then "pt.wttr.in"
      when IT then "it.wttr.in"
      when JA then "ja.wttr.in"
      when UK then "uk.wttr.in"
      when SV then "sv.wttr.in"
      else         "wttr.in"
      end
    end

    def observation_time : String
      case self
      when EN then "Observed at"
      when DE then "Beobachtet um"
      when PL then "Zaobserwowano o"
      when RU then "Наблюдается в"
      when TR then "Gözlemlendi"
      when FR then "Observé à"
      when BE then "Назірана ў"
      when ZH then "观察时间"
      when ES then "Observado en"
      when PT then "Observado em"
      when IT then "Osservato a"
      when JA then "で観察されました"
      when UK then "Спостерігається в"
      when SV then "Observerat vid"
      else         "Observed at"
      end
    end

    def feels_like : String
      case self
      when EN then "Feels Like"
      when DE then "Gefühlt wie"
      when PL then "Temperatura odczuwalna"
      when RU then "Ощущается как"
      when TR then "Hissedilen"
      when FR then "Ressenti"
      when BE then "Адчуваецца як"
      when ZH then "体感温度"
      when ES then "Sensación térmica"
      when PT then "Sensação térmica"
      when IT then "Sensazione Termica"
      when JA then "体感温度"
      when UK then "Відчувається як"
      when SV then "Känns som"
      else         "Feels Like"
      end
    end

    def humidity : String
      case self
      when EN then "Humidity"
      when DE then "Luftfeuchtigkeit"
      when PL then "Wilgotność"
      when RU then "Влажность"
      when TR then "Nem"
      when FR then "Humidité"
      when BE then "Вільготнасць"
      when ZH then "湿度"
      when ES then "Humedad"
      when PT then "Umidade"
      when IT then "Umidità"
      when JA then "湿度"
      when UK then "Вогкість"
      when SV then "Luftfuktighet"
      else         "Humidity"
      end
    end

    def location : String
      case self
      when EN then "Location"
      when DE then "Standort"
      when PL then "Lokalizacja"
      when RU then "Местоположение"
      when TR then "Konum"
      when FR then "Lieu"
      when BE then "Месцазнаходжанне"
      when ZH then "地区"
      when ES then "Ubicación"
      when PT then "Localização"
      when IT then "Posizione"
      when JA then "地点"
      when UK then "Розташування"
      when SV then "Plats"
      else         "Location"
      end
    end

    def today : String
      case self
      when EN then "Today"
      when DE then "Heute"
      when PL then "Dzisiaj"
      when RU then "Сегодня"
      when TR then "Bugün"
      when FR then "Aujourd'hui"
      when BE then "Сёння"
      when ZH then "今日天气"
      when ES then "Hoy"
      when PT then "Hoje"
      when IT then "Oggi"
      when JA then "今日"
      when UK then "Сьогодні"
      when SV then "Idag"
      else         "Today"
      end
    end

    def tomorrow : String
      case self
      when EN then "Tomorrow"
      when DE then "Morgen"
      when PL then "Jutro"
      when RU then "Завтра"
      when TR then "Yarın"
      when FR then "Demain"
      when BE then "Заўтра"
      when ZH then "明日天气"
      when ES then "Mañana"
      when PT then "Amanhã"
      when IT then "Domani"
      when JA then "明日"
      when UK then "Завтра"
      when SV then "Imorgon"
      else         "Tomorrow"
      end
    end

    def fog : String
      case self
      when EN then "Fog"
      when DE then "Nebel"
      when PL then "Mgła"
      when RU then "Туман"
      when TR then "Sis"
      when FR then "Brouillard"
      when BE then "Туман"
      when ZH then "雾"
      when ES then "Niebla"
      when PT then "Nevoeiro"
      when IT then "Nebbia"
      when JA then "霧"
      when UK then "Туман"
      when SV then "Dimma"
      else         "Fog"
      end
    end

    def frost : String
      case self
      when EN then "Frost"
      when DE then "Frost"
      when PL then "Mróz"
      when RU then "Мороз"
      when TR then "Don"
      when FR then "Gel"
      when BE then "Мароз"
      when ZH then "霜"
      when ES then "Escarcha"
      when PT then "Geada"
      when IT then "Gelo"
      when JA then "霜"
      when UK then "Мороз"
      when SV then "Frost"
      else         "Frost"
      end
    end

    def overcast : String
      case self
      when EN then "Overcast"
      when DE then "Bewölkung"
      when PL then "Zachmurzenie"
      when RU then "Пасмурно"
      when TR then "Bulutlu"
      when FR then "Couvert"
      when BE then "Хмурна"
      when ZH then "多云"
      when ES then "Nublado"
      when PT then "Nublado"
      when IT then "Nuvoloso"
      when JA then "曇り"
      when UK then "Похмуро"
      when SV then "Mulet"
      else         "Overcast"
      end
    end

    def rain : String
      case self
      when EN then "Rain"
      when DE then "Regen"
      when PL then "Deszcz"
      when RU then "Дождь"
      when TR then "Yağmur"
      when FR then "Pluie"
      when BE then "Дождж"
      when ZH then "雨"
      when ES then "Lluvia"
      when PT then "Chuva"
      when IT then "Pioggia"
      when JA then "雨"
      when UK then "Дощ"
      when SV then "Regn"
      else         "Rain"
      end
    end

    def snow : String
      case self
      when EN then "Snow"
      when DE then "Schnee"
      when PL then "Śnieg"
      when RU then "Снег"
      when TR then "Kar"
      when FR then "Neige"
      when BE then "Снег"
      when ZH then "雪"
      when ES then "Nieve"
      when PT then "Neve"
      when IT then "Neve"
      when JA then "雪"
      when UK then "Сніг"
      when SV then "Snö"
      else         "Snow"
      end
    end

    def sunshine : String
      case self
      when then "Sunshine"
      when DE then "Sonnenschein"
      when PL then "Nasłonecznienie"
      when RU then "Солнечно"
      when TR then "Güneş ışığı"
      when FR then "Ensoleillé"
      when BE then "Сонечна"
      when ZH then "晴"
      when ES then "Soleado"
      when PT then "Sol"
      when IT then "Sole"
      when JA then "晴れ"
      when UK then "Сонячно"
      when SV then "Solsken"
      else         "Sunshine"
      end
    end

    def thunder : String
      case self
      when EN then "Thunder"
      when DE then "Donner"
      when PL then "Burza"
      when RU then "Гроза"
      when TR then "Gök gürültüsü"
      when FR then "Orages"
      when BE then "Навальніца"
      when ZH then "雷暴"
      when ES then "Tormenta"
      when PT then "Trovão"
      when IT then "Tuono"
      when JA then "雷"
      when UK then "Гроза"
      when SV then "Åska"
      else         "Thunder"
      end
    end

    def wind : String
      case self
      when EN then "Wind"
      when DE then "Wind"
      when PL then "Wiatr"
      when RU then "Ветер"
      when TR then "Rüzgar"
      when FR then "Vent"
      when BE then "Вецер"
      when ZH then "风速"
      when ES then "Viento"
      when PT then "Vento"
      when IT then "Vento"
      when JA then "風速"
      when UK then "Вітер"
      when SV then "Vind"
      else         "Wind"
      end
    end

    def weather_desc : String
      case self
      when EN then "weatherDesc"
      when DE then "lang_de"
      when PL then "lang_pl"
      when RU then "lang_ru"
      when TR then "lang_tr"
      when FR then "lang_fr"
      when BE then "lang_be"
      when ZH then "lang_zh"
      when ES then "lang_es"
      when PT then "lang_pt"
      when IT then "lang_it"
      when JA then "lang_ja"
      when UK then "lang_uk"
      when SV then "lang_sv"
      else         "weatherDesc"
      end
    end

    def locale : String
      case self
      when EN then "en_US"
      when DE then "de_DE"
      when PL then "pl_PL"
      when RU then "ru_RU"
      when TR then "tr_TR"
      when FR then "fr_FR"
      when BE then "be_BY"
      when ZH then "zh_CN"
      when ES then "es_ES"
      when PT then "pt_PT"
      when IT then "it_IT"
      when JA then "ja_JP"
      when UK then "uk_UA"
      when SV then "sv_SE"
      else         "en_US"
      end
    end
  end
end
