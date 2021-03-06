ENV['SINATRA_ENV'] ||="Development"
require 'bigdecimal'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'