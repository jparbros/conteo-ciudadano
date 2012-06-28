class RedirectMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)

    request = Rack::Request.new(env)

    Rails.logger.info "======================================"
    Rails.logger.info "request.host => #{request.host}"
    Rails.logger.info "ENV['ADMIN_URL'] => #{ENV['ADMIN_URL']}"
    Rails.logger.info " 1st id => #{request.host.match(/#{ENV['ADMIN_URL']}/ ) && !request.uri.match(/#{ENV['ADMIN_URL']}\/admin.*/)}"
    Rails.logger.info " 2nd id => #{!request.host.match(/#{ENV['ADMIN_URL']}/ )&& request.uri.end_with?('/admin')}"
    Rails.logger.info "======================================"
    if request.host.match(/#{ENV['ADMIN_URL']}/ ) && !request.uri.match(/#{ENV['ADMIN_URL']}\/admin.*/)
      [301, {"Location" => "https://#{ENV['ADMIN_URL']}/admin"}, self]
    elsif !request.host.match /#{ENV['ADMIN_URL']}/ && request.uri.end_with?('/admin')
      [404, {}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end

end
