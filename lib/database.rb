require 'yaml'

require_relative '../models/models.rb'

CONFIG_FILE = File.expand_path(File.join('config.yaml'))

config = YAML::load(File.read(CONFIG_FILE))
MongoMapper.connection = Mongo::Connection.new(config['hostname'])
MongoMapper.database = config['database']
