CalorieCounter::Application.routes.draw do
  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'

  resources "user_sessions"

  resources :users do
    resources :meals
    resources :comments, :only => [:new, :create, :destroy]
    get :superpowers
  end

  root :to => "meals#index"
  resources :meals, :only => :destroy do
    resources :comments, :only => [:new, :create, :destroy]
  end
end

