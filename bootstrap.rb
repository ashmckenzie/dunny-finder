require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'pathname'
require 'yaml'

require_relative 'lib/gw_logger'

REMOTE_TOILET_XML_URL = 'http://raw.data.gov.au/610/Toiletmap.zip'
LOCAL_TOILET_XML_ZIP_LOCATION = Pathname.new('tmp/Toiletmap.zip').expand_path
LOCAL_TOILET_XML_LOCATION = Pathname.new('tmp/Toiletmap/ToiletmapExport.xml').expand_path

$log = GWLogger.new

require File.join(File.dirname(__FILE__), 'lib', 'database.rb')
