default_run_options[:pty] = true

set :application, "Dunny Finder"
set :repository,  "git@github.com:ashmckenzie/dunny-finder.git"
set :scm, :git
set :deploy_to, '/var/www-virtuals/dunny-finder'
set :keep_releases, 5
set :use_sudo, false

role :web, "projects.the-rebellion.net"

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.

namespace :deploy do

  before 'deploy:symlink' do
    run "cd #{deploy_to}/current ; bundle install"
  end

  desc 'Restart'
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"  
  end

end
