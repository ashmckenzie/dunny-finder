require 'dm-timestamps'
require 'dm-migrations'

require File.expand_path(File.join(File.dirname(__FILE__), 'models', 'models.rb'))

CONFIG_FILE = File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'config.yaml'))

config = YAML::load(File.read(CONFIG_FILE))

DataMapper.setup(:default, "mysql://localhost/#{config['database']}")

DataMapper.finalize
DataMapper.auto_upgrade!
