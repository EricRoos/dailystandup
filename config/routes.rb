Rails.application.routes.draw do
  resources :surveys
  resources :teams do
    resources :standup_reports
    resources :team_members
  end
  devise_for :users

  root 'teams#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
