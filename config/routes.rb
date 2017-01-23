Rails.application.routes.draw do

  get '/logout' => "users#logout"
  get '/login' => "users#login_form"
  post '/login' => "users#login"

  resources :users do
    resources :posts, only: [:new, :create]
  end

  resources :posts, only: [:index, :show, :edit, :destroy]
end
