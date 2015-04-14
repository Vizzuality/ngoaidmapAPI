# config valid only for Capistrano 3.1
lock '3.3.5'

set :application, 'ngo-api'
set :repo_url, 'git@github.com:Vizzuality/ngoaidmapAPI.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'banners'
# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/ubuntu/ngo-api'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
#set :default_env, { path: "/usr/local/rvm/gems/ruby-2.1.2@global/bin/bundler" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# set the locations that we will look for changed assets to determine whether to precompile
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

  desc 'reload the database with seed data'
  after :publishing, :seed do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        if fetch(:rails_env) == "production"
          execute :rake, 'db:migrate RAILS_ENV=production'
          execute :rake, 'db:seed RAILS_ENV=production'
        else
          execute :rake, 'db:migrate RAILS_ENV=staging'
          execute :rake, 'db:seed RAILS_ENV=staging'
        end
      end
    end
  end

  desc 'Restart application'
  after :seed, :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     within release_path do
  #       execute :rake, 'memcached:flush RAILS_ENV=production'
  #     end
  #   end
  # end

  after :failed, :rollback

end
