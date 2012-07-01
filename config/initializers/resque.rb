ENV["REDISTOGO_URL"] ||= "http://localhost:6379"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Resque.schedule = YAML.load_file(File.join(File.dirname(__FILE__), '../resque_schedule.yml'))

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }