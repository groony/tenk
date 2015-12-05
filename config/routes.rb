Rails.application.routes.draw do
  root 'projects#index'
  resources :projects, only: :show
  mount Sidekiq::Web, at: '/sidekiq'
end
