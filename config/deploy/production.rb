# Production host credentials
server 'tools.snpdev.ru',
       roles: %w(web app db),
       primary: true,
       user: 'tools'

set :keep_releases, 10
set :puma_threads, [4, 4]
set :puma_workers, 8

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
