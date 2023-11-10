Rails.application.routes.draw do
  resources :estudiantes
  #root 'estudiantes#index'

  root 'github#repositories'
 
  get '/github/repositories', to: 'github#repositories'
  
  get '/github/download_repository', to: 'github#download_repository', as: 'download_repository'
  # Otros enrutamientos de tu aplicación...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
  