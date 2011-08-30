require 'dm-timestamps'
require 'dm-migrations'

Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each do |file|
  require file
end

CONFIG_FILE = File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'config.yaml'))

config = YAML::load(File.read(CONFIG_FILE))

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "mysql://localhost/#{config['database']}")

DataMapper.finalize
DataMapper.auto_upgrade!
