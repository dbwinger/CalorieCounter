CalorieCounter::Application.routes.draw do
  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'

  resources "user_sessions"#, :only => [:new,:destroy]

  resources :users do
    resources :meals
  end

  root :to => "meals#index"
  resources :meals
end

