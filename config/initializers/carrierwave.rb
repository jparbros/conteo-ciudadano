CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'Google',
    :google_storage_access_key_id => 'GOOGVZIMJX5HY5U52MDH',
    :google_storage_secret_access_key => 'vntfgFHrds1XeXXXmFPCJYsqw2er7HEtfHtDRi3C'
  }
  config.fog_directory = 'conteociudadano'
end