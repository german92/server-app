set :port, 2222
set :user, 'german' # e.g. 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master' # e.g. 'master'

server '127.0.0.1', # e.g. 192.xxx.xxx.xxx
  roles: [:web, :app],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/german/app/#{fetch(:application)}" # e.g. "/var/apps/rails_blog"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true
