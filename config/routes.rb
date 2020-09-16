Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :user_badges
      resources :prompts
      resources :segments
      resources :languages
      resources :levels
      resources :segment_corrections
      resources :corrections
      resources :badges
      resources :posts
      resources :user_languages

      root to: "users#index"
    end
  devise_for :users

  resources :posts do
    resources :corrections
  end

  resources :prompts
  resources :users
  resources :resources, only: :index

  root to: 'posts#index'
end
