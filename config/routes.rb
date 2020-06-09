Rails.application.routes.draw do
  get 'service_worker/service_worker'
  get 'service_worker/manifest'
  resources :surveys
  resources :teams do
    resources :standup_reports
    resources :team_members
    resources :likes
  end
  devise_for :users
  root 'teams#index'
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
