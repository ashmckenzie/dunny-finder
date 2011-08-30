require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'pathname'
require 'yaml'
require 'json'
require 'representative/json'

BASE_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
LIB_DIR = File.join(BASE_DIR, 'lib')
CONFIG_DIR = File.join(BASE_DIR, 'config')

CONFIG_FILE = File.join(CONFIG_DIR, 'config.yaml')
DATABASE_FILE = File.join(CONFIG_DIR, 'database.yaml')

require File.join(LIB_DIR, 'utils')
require File.join(LIB_DIR, 'gw_logger')
require File.join(LIB_DIR, 'dunny_finder')
require File.join(LIB_DIR, 'database.rb')

$log = GWLogger.new
$config = YAML::load(File.read(CONFIG_FILE))
