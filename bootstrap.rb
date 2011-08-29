require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'pathname'
require 'yaml'
require 'json'
require 'representative/json'

require File.join(File.dirname(__FILE__), 'lib', 'utils')
require File.join(File.dirname(__FILE__), 'lib', 'gw_logger')
require File.join(File.dirname(__FILE__), 'lib', 'dunny_finder')
require File.join(File.dirname(__FILE__), 'lib', 'database.rb')

$log = GWLogger.new
