Rails.application.routes.draw do
  resources :estudiantes
  
  #root 'estudiantes#index'

  root 'github#repositories'
 
  get '/github/repositories', to: 'github#repositories'
  
  get '/github/download_repository', to: 'github#download_repository', as: 'download_repository'
  
  # Utiliza el formato correcto para la ruta de new_repository
  get 'github/new_repository', to: 'github#new_repository', as: 'new_repository'
  
  post 'github/upload_repository', to: 'github#upload_repository'
  

  # Otros enrutamientos de tu aplicación...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
