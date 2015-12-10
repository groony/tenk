# Set here your application name and git repository
set :application, 'tenk'
set :repo_url, 'git@github.com:groony/tenk.git'
set :linked_files, %w(config/application.yml)
set :linked_dirs, fetch(:linked_dirs, []) + %w(public/uploads)

# puma config
set :puma_worker_timeout, 30
set :puma_init_active_record, true
