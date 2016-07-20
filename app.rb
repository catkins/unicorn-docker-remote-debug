require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'
require 'redis'

class HelloApp < Sinatra::Base
  configure(:development) do
    register Sinatra::Reloader
    require 'byebug' if ENV['BYEBUG_PORT']
  end

  get '/' do
    byebug
    json message: "Hello world", hits: redis.incr(:hello_app_hits)
  end

  private

  def redis
    @redis ||= Redis.new(url: ENV['REDIS_URL'])
  end
end
