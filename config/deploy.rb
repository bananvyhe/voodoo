# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "voodoo"
set :repo_url, "git://github.com/bananvyhe/voodoo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main"

set :pty,  false
set :rbenv_map_bins, %w{rake gem bundle ruby rails sidekiq sidekiqctl}

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/apps/farmspot"
set :rbenv_ruby, '3.0.2'
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml"
# append :linked_files, "config/secrets.yml.key"
append :linked_files, "config/master.key"
# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do
	desc "Update cron jobs"
  task :update_crontab do
  	on roles(:deploy) do
  		run "cd #{release_path} && whenever --update-crontab voodoo"
  	end
  end
    desc "Clear cron jobs"
  task :clear_crontab do
  	on roles(:deploy) do
    	run "cd #{release_path} && whenever --clear-crontab voodoo"
  	end
  end
end
after 'deploy:starting', 'deploy:clear_crontab'
after 'deploy:starting', 'deploy:update_crontab'
after 'deploy:starting', 'sidekiq:quiet'
after 'deploy:reverted', 'sidekiq:restart'
after 'deploy:published', 'sidekiq:restart'
# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :MALLOC_ARENA_MAX, 2
#after :some_other_task, :'passenger:restart'