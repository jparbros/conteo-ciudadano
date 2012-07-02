worker: bundle exec QUEUE=* rake resque:work
scheduler: bundle exec QUEUE=* rake resque:scheduler
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb