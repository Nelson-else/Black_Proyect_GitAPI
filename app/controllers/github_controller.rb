
class GithubController < ApplicationController
    # app/controllers/github_controller.rb
    include HTTParty
    
    base_uri 'https://api.github.com'
  
    def repositories
      # Aquí puedes personalizar la lógica según tus necesidades
      username = 'Nelson-else'
      #username = 'AnonymousJHRR'bundle
      #username = 'matiasgarcia'
      response = self.class.get("/users/#{username}/repos")
  
      if response.success?
        @repositories = JSON.parse(response.body)
      else
        @error_message = "Error al obtener los repositorios de GitHub. Detalles: #{response.code} - #{response.message}"
      end
    end

    def download_repository
        # Obtén el nombre del repositorio desde los parámetros
        repo_name = params[:repo_name]
        # Construye la URL del repositorio
        repo_url = "https://github.com/#{params[:username]}/#{repo_name}.git"
        # Define el directorio donde se almacenará el repositorio
        repo_path = Rails.root.join('repos', repo_name)
    
        # Clona el repositorio en el directorio especificado
        begin
          Git.clone(repo_url, repo_name, path: repo_path)
          @success_message = "Repositorio '#{repo_name}' clonado con éxito en '#{repo_path}'."
        rescue Git::GitExecuteError => e
          @error_message = "Error al clonar el repositorio '#{repo_name}'. Detalles: #{e.message}"
        end
      end
end