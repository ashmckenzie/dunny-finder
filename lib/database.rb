require 'dm-timestamps'
require 'dm-migrations'

Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each do |file|
  require file
end

database = YAML::load(File.read(Paths.database_file))

#DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "mysql://#{database['username']}:#{database['password']}@localhost/#{database['name']}")

DataMapper.finalize
DataMapper.auto_upgrade!
