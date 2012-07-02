# encoding: UTF-8
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

  KINDS = {'B' => 'Básica', 'C' => 'Contigua', 'E' => 'Especial', 'EX' => 'Extraordinaria'}

  def self.extract_tuits
    search
    parse_tuit
  end

  def self.search
    last_id = TwitterId.last.try(:last_twitter_id)
    @result ||= Twitter.search('#voto2012', result_type: 'recent', rpp: 100, include_entities: true, since_id: last_id).results
    @result.sort!{|x,y| y[:id] <=> x[:id] }
    TwitterId.create(last_twitter_id: @result.last[:id])
  end

  def self.parse_tuit
    @result.each do |result|
      parsed = result[:text].match /([a-zA-Z]+)-([a-zA-Z]+)-([0-9]+)-([0-9]+)-([a-zA-Z]+)/
      if parsed && !TuitScaned.exists?(twitter_id: result[:id].to_s)
        tuit_scaned = TuitScaned.create(twitter_id: result[:id])
        state = State.find_by_name(STATES[parsed[1]])

        if state
          boxes = Box.where(state_id: state.id, section: parsed[4])

          if parsed[5].size > 1 && parsed[5].first != 'B'
            box = boxes.where(kind: KINDS[parsed[5].first.upcase], number: parsed[5].last ).first
          else
            box = boxes.where(kind: KINDS[parsed[5].first.upcase]).first
          end

          puts box

          result.media.each do |media|
            result_image = box.result_images.new
            result_image.remote_blanket_url = media.media_url
            result_image.save!
          end

          result.urls.each do |url|
            external_url = box.external_urls.new
            external_url.url = url.display_url
            external_url.save!
          end
        end
        tuit_scaned.create!
      end
    end
  end

end