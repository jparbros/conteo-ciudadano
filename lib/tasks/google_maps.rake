# encoding: UTF-8
desc "Agregando las coordenadas geometrias"
task :add_geometry => [:environment] do
  Box.find_in_batches(:conditions => ['latitude is null and longitude is null'], batch_size: 10, start: 25359) do |boxes|
    hydra = Typhoeus::Hydra.new
    boxes.each do |box|
      request = Typhoeus::Request.new box.address_to_google
      request.on_complete do |response|
        puts "Actualizando casilla ##{box.id} - 143 190 "
        if response.body.present?
          json_response = JSON.parse(response.body)
          if json_response['results'].present?
            puts " ACTUALIZADO"
            box.latitude = json_response['results'].first['geometry']['location']['lng']
            box.longitude = json_response['results'].first['geometry']['location']['lat']
            box.gmaps = true
            box.save
          else
            puts "#{json_response['status']}"
          end
        end
      end
      hydra.queue(request)
    end
    hydra.run
    sleep 15
  end
end