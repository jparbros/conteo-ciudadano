require 'resque/tasks'
require 'resque_scheduler/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
end

task "resque:scheduler_setup" => :environment do
  file = Rails.root + 'config/resque_schedule.yml'
  Resque.schedule = YAML.load_file file
end