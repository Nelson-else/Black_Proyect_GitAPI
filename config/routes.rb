Rails.application.routes.draw do
  resources :estudiantes
  #root 'estudiantes#index'
  get '/github/repositories', to: 'github#repositories'
  root 'github#repositories'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
  