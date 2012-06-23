if Rails.env.production?
  Airbrake.configure do |config|
    config.api_key = '3a4e26a6612d3312c8d0a3488e556cc2'
  end
end