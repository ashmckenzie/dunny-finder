require 'rubygems'
require 'sinatra'
require File.expand_path(File.join(File.dirname(__FILE__), 'web', 'application'))

set :run, false

run Sinatra::Application
