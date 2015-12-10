server 'tools-direct.snpdev.ru',
       roles:   %w(web app db),
       primary: true,
       user:    'tools'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :puma_threads, [4, 4]
set :puma_workers, 2
