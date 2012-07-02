worker: bundle exec COUNT=5 QUEU=* rake resque:work
scheduler: bundle exec QUEU=* rake resque:scheduler
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb