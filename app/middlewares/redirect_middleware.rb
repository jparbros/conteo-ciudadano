class RedirectMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)

    request = Rack::Request.new(env)

    if Rails.env.production? && request.host.match(/#{ENV['ADMIN_URL']}/ ) && !request.fullpath.match(/\/admin.*/)
      [301, {"Location" => "https://#{ENV['ADMIN_URL']}/admin"}, self]
    elsif Rails.env.production? && !request.host.match(/#{ENV['ADMIN_URL']}/ )&& request.fullpath.match(/\/admin.*/)
      [404, {}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end

end
