require 'dm-timestamps'
require 'dm-migrations'

require File.join(File.dirname(__FILE__), '..', 'models', 'models.rb')

CONFIG_FILE = File.expand_path(File.join('config.yaml'))

config = YAML::load(File.read(CONFIG_FILE))
#MongoMapper.connection = Mongo::Connection.new(config['hostname'])
#MongoMapper.database = config['database']

DataMapper.setup(:default, "mysql://localhost/#{config['database']}")
