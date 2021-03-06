Rails.application.routes.draw do
  resources 'product_orders' do
    member do
      get :confirmation
    end
  end
  get 'service_worker/service_worker'
  get 'service_worker/manifest'
  resources :surveys
  resources :teams do
    resources :activities
    resources :standup_reports
    resources :team_members
    resources :likes
    resources :billing, only: [:index, :new] do
      collection do 
        get :success
      end
    end
    resources 'product_orders' do
      member do
        get :confirmation
      end
    end
  end
  devise_for :users
  resources :billing, only: [:index, :new] do
    collection do 
      get :success
    end
  end
  root 'teams#index'
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
