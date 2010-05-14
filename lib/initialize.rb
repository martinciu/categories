require 'rubygems'
require 'faker'
require 'activesupport'
require "mongo_mapper"
require 'database_cleaner'
require 'rbench'

DB_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), "../config/database.yml" ))
SETTINGS = YAML.load_file(File.join(File.dirname(__FILE__), "../config/settings.yml"))["small"]

MongoMapper.connection = Mongo::Connection.new(DB_CONFIG['host'])
MongoMapper.database = "#{DB_CONFIG["database"]}-#{SETTINGS["database_suffix"]}"

DatabaseCleaner.strategy = :truncation

require(File.join(File.dirname(__FILE__), 'item'))
require(File.join(File.dirname(__FILE__), 'account'))
require(File.join(File.dirname(__FILE__), 'category'))



