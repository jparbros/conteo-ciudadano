CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
    :region                 => 'eu-west-1'
  }
  config.fog_directory  = 'stage'
  config.s3_bucket = "conteociudadano"
end