ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'json'
require 'net/http'
require 'open-uri'
require 'rack-flash'

Bundler.require(:default, ENV['SINATRA_ENV'])

require "dotenv/load"

configure :development do
    set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.db"
end

require_all 'lib'
require_all 'app'