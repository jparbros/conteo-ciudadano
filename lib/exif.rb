module Exif
  def hash_exif
    {
      model: blanket.get_exif('Model'),
      date_time: blanket.get_exif('DateTimeOriginal'),
      manufacturer: blanket.get_exif('Manufacturer'),
      compression: get_compression,
      resolution: get_resolution,
      software: blanket.get_exif('Software'),
      location: get_geo
    }
  end

  def get_geo
    img_lat = blanket.get_exif('GPSLatitude').split(', ') rescue nil
    img_lng = blanket.get_exif('GPSLongitude').split(', ') rescue nil

    lat_ref = blanket.get_exif('GPSLatitudeRef') rescue nil
    lng_ref = blanket.get_exif('GPSLongitudeRef') rescue nil

    return unless img_lat && img_lng && lat_ref && lng_ref

    latitude = to_frac(img_lat[0]) + (to_frac(img_lat[1])/60) + (to_frac(img_lat[2])/3600)
    longitude = to_frac(img_lng[0]) + (to_frac(img_lng[1])/60) + (to_frac(img_lng[2])/3600)

    latitude = latitude * -1 if lat_ref == 'S'  # (N is +, S is -)
    longitude = longitude * -1 if lng_ref == 'W'   # (W is -, E is +)

    return {latitude: latitude, longitude: longitude}
  end

  def to_frac(strng)
    numerator, denominator = strng.split('/').map(&:to_f)
    denominator ||= 1
    numerator/denominator
  end

  def get_compression
    case blanket.get_exif('Compression')
    when '1'
      'uncompressed'
    when '6'
      'JPEG compression'
    end
  end

  def get_resolution
    case blanket.get_exif('ResolutionUnit')
    when '2'
      'inches'
    when '3'
      'centimeters'
    end
  end

  def coordinates_to_google_maps

  end
end