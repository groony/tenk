Rails.application.routes.draw do
  root 'projects#index'
  resources :projects, only: :show
  resources :time_entries, only: [:edit, :update]
  mount Sidekiq::Web, at: '/sidekiq'
end
