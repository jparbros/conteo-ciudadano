class Extractor

  STATES = {
    'AGS' => "Aguascalientes",
    'BC' => "Baja california",
    "BCS" => "Baja california sur",
    "CAMP" => "Campeche",
    "COAH" => "Coahuila",
    "COL" => "Colima",
    "CHIA" => "Chiapas",
    "CHIH" => "Chihuahua",
    "DF" => "Distrito federal",
    "DGO" => "Durango",
    "GTO" => "Guanajuato",
    "GRO" => "Guerrero",
    "HGO" => "Hidalgo",
    "JAL" => "Jalisco",
    "MEX" => "Mexico",
    "MICH" => "Michoacan",
    "MOR" => "Morelos",
    "NAY" => "Nayarit",
    "NL" => "Nuevo leon",
    "OAX" => "Oaxaca",
    "PUE" => "Puebla",
    "QRO" => "Queretaro",
    "QR" => "Quintana roo",
    "SLP" => "San luis potosi",
    "SIN" => "Sinaloa",
    "SON" => "Sonora",
    "TAB" => "Tabasco",
    "TAMPS" => "Tamaulipas",
    "TLAX" => "Tlaxcala",
    "VER" => "Veracruz",
    "YUC" => "Yucatan",
    "ZAC" => "Zacatecas"
  }

  def self.extract_tuits
    search
    parse_tuit
  end

  def self.search
    @result ||= Twitter.search('#voto2012', result_type: 'recent', rpp: 100, include_entities: true, since_id: TwitterId.last.try(:last_twitter_id)).results
    TwitterId.create(last_twitter_id: @result.last[:id])
  end

  def self.parse_tuit
    @result.each do |result|

      parsed = result[:text].match /([a-zA-Z]+)-([a-zA-Z]+)-([0-9]+)-([0-9]+)-([a-zA-Z]+)/
      if parsed
        begin
          tuit_scaned = TuitScaned.create(result[:id])
          state = State.find_by_name(STATES[parsed[1]])

          if state
            box = Box.find_boxes(state.id, parsed[4])
            result[:entities][:media].each do |media|
              result_image = box.result_images.new
              result_image.blanket = media[:media_url]
              result_image.save!
            end

            result[:entities][:urls].each do |url|
              external_url = box.external_urls.new
              external_url.url = url[:display_url]
              external_url.save!
            end
          end

          tuit_scaned.create!
        rescue Exception => e
          Airbrake.notify(e)
        end
      end
    end
  end

end