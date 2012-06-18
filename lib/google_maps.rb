# encoding: UTF-8
module GoogleMaps
  def address_to_google
    URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{parsed_address}&sensor=false")
  end

  def parsed_address
    complete_address.gsub('#','').gsub(/\d{5}/,'').gsub(',',' ').gsub(/código postal/,'').gsub('sin número','').gsub('c.p.','').gsub('Domicilio conocido','').gsub('código póstal','').lstrip.strip
  end

  def complete_address
    if missing_state
      "#{address} #{state_name.downcase}"
    else
      address
    end
  end

  def missing_state
    if !!address.downcase.match(/(avenida|calle|andador|carretera) #{state_name.downcase}/)
      !(address.downcase.scan(state_name.downcase).size >= 2)
    else
      address.downcase.scan(state_name.downcase).size < 1
    end
  end

  def options_for_maps
    {address: parsed_address}.to_json
  end

  def geometry
    "#{latitude}, #{longitude}"
  end

  def geolocalizable?
    latitude.present? && longitude.present?
  end
end