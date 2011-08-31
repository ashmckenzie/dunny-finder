require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'pathname'
require 'yaml'
require 'json'
require 'representative/json'

require File.expand_path(File.join(File.dirname(__FILE__), 'paths'))
require File.join(Paths.lib_dir, 'utils')
require File.join(Paths.lib_dir, 'gw_logger')
require File.join(Paths.lib_dir, 'dunny_finder')
require File.join(Paths.lib_dir, 'database.rb')
require File.join(Paths.lib_dir, 'search.rb')

$log = GWLogger.new
$config = YAML::load(File.read(Paths.config_file))
