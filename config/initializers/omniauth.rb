Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fP4o5frRF4uAowJX3Uz5TQ', '04ecvOhlObD0wGEb3lcsPGGXBTjnQa8nyVue4waG4'
  provider :facebook, '419620151411274', '62a84e25acab5c0da30e918d2b1d57fa', {:scope => 'publish_stream,offline_access,email'}
end