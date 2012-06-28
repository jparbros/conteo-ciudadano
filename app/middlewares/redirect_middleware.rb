class RedirectMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)

    request = Rack::Request.new(env)

    if request.host.match(/#{ENV['ADMIN_URL']}/ ) && !request.host.match(/#{ENV['ADMIN_URL']}\/admin\/.*/)
      [301, {"Location" => "https://#{ENV['ADMIN_URL']}/admin"}, self]
    elsif !request.host.match /#{ENV['ADMIN_URL']}/ && request.host.end_with?('/admin')
      [404, {}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end

end
