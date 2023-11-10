class GithubController < ApplicationController

    # app/controllers/github_controller.rb
    include HTTParty
    base_uri 'https://api.github.com'
  
    def repositories
      # Aquí puedes personalizar la lógica según tus necesidades
      username = 'tu_nombre_de_usuario_en_github'
      response = self.class.get("/users/#{username}/repos")
  
      if response.success?
        @repositories = JSON.parse(response.body)
      else
        @error_message = "Error al obtener los repositorios de GitHub. Detalles: #{response.code} - #{response.message}"
      end
    end
end