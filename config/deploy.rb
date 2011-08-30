require File.join(File.dirname(__FILE__), '..', 'lib', 'bootstrap.rb')

default_run_options[:pty] = true

set :application, "Dunny Finder"
set :repository,  "git@github.com:ashmckenzie/dunny-finder.git"
set :scm, :git
set :deploy_to, '/var/www-virtuals/dunny-finder'
set :keep_releases, 5
set :use_sudo, false

role :web, "projects.the-rebellion.net"

# RVM stuff
#
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

namespace :deploy do

  before 'deploy:symlink' do
    run "cd #{deploy_to}/current ; bundle install"
    run "mkdir -p #{shared_path}/config"
    put File.read(Paths.database_file), "#{shared_path}/config/database.yaml"
    run "ln -nfs #{shared_path}/config/database.yaml #{release_path}/config/database.yaml"
  end

  desc 'Restart'
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"  
  end
end
