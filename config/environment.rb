require 'bundler'
Bundler.require
require 'sqlite3'
require 'csv'
# require_relative '../lib/queries.rb'

# Setup a DB connection here
DB = {:conn => SQLite3::Database.new("db/daily_show_guests.db")}
