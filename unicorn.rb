preload_app true

worker_processes_count = (ENV['UNICORN_WORKERS'] || 2).to_i
worker_processes worker_processes_count
timeout 180
listen 3000, :backlog => 2048
pid "/tmp/unicorn.pid"


if ENV['BYEBUG_PORT']
  puts 'Starting unicorn with a single worker'
  worker_processes_count = 1
  timeout 1000

  after_fork do |server, worker|

    puts "Remote debugger listening on port: #{ENV['BYEBUG_PORT']}"
    puts "Start byebug with `bundle exec byebug --remote localhost:#{ENV['BYEBUG_PORT']}`"

    require 'byebug/core'
    Byebug.start_server '0.0.0.0', ENV['BYEBUG_PORT'].to_i
  end
end
