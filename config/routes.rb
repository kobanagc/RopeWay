Rails.application.routes.draw do
  devise_for :users
  root to: 'profiles#index'
  resources :profiles
  post "profiles/likes/:profile_id/create" => "likes#create"
  post "likes/:profile_id/destroy" => "likes#destroy"
end
