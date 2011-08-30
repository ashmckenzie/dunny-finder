require 'rubygems'
require 'sinatra'
require 'rack/cache'

use Rack::Cache,
  :verbose     => true,
  :metastore   => 'file:/Users/ash/Personal/dunny-finder/cache/rack/meta',
  :entitystore => 'file:/Users/ash/Personal/dunny-finder/cache/rack/body'

require File.expand_path(File.join(File.dirname(__FILE__), 'web', 'application'))

set :run, false

run Sinatra::Application
