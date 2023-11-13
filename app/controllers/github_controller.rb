
class GithubController < ApplicationController
    
    # app/controllers/github_controller.rb
    include HTTParty
    base_uri 'https://api.github.com'
  
    def repositories
      # Aquí puedes personalizar la lógica según tus necesidades
      username = 'Nelson-else'
      #username = 'AnonymousJHRR'
      #username = 'matiasgarcia'
      response = self.class.get("/users/#{username}/repos")
  
      if response.success?
        @repositories = JSON.parse(response.body)
      else
        @error_message = "Error al obtener los repositorios de GitHub. Detalles: #{response.code} - #{response.message}"
      end
    end

    def download_repository
        # Obtén el nombre del repositorio y el nombre de usuario desde los parámetros
        repo_name = params[:repo_name]
        username = params[:username]
      
        puts "Nombre del repositorio: #{repo_name.inspect}"
        puts "Nombre de usuario: #{username.inspect}"
      
        if repo_name.present? && username.present?
          # Construye la URL del repositorio
          repo_url = "https://github.com/#{username}/#{repo_name}.git"
          # Define el directorio donde se almacenará el repositorio
          repo_path = Rails.root.join('repos', repo_name)
      
          # Clona el repositorio utilizando el comando de sistema
          command = "git clone #{repo_url} #{repo_path}"
          success = system(command)
      
          if success
            @success_message = "Nombre de usuario: '#{username}'. <br> <br> Repositorio: '#{repo_name}' <br> <br> Clonado con éxito en: '#{repo_path}'."
          else
            @error_message = "Error al clonar el repositorio '#{repo_name}'."
          end
        else
          @error_message = "Nombre de repositorio o nombre de usuario inválido."
        end
      end

     

      def new_repository
        # Renderiza el formulario para subir un nuevo repositorio
      end
    
      def upload_repository
        uploaded_file = params[:repository_file]
    
        if uploaded_file.present?
          # Guarda el archivo en algún lugar, por ejemplo, en el directorio 'uploads'
          file_path = Rails.root.join('uploads', uploaded_file.original_filename)
              # Crea el directorio si no existe
            Dir.mkdir(file_path.dirname) unless File.directory?(file_path.dirname)
          File.open(file_path, 'wb') do |file|
            file.write(uploaded_file.read)
          end
    
          # Asocia el nuevo repositorio con la cuenta del usuario actual
          current_user.repositories.create(name: uploaded_file.original_filename, path: file_path.to_s)
    
          @upload_success = "Repositorio '#{uploaded_file.original_filename}' subido con éxito."
    
          # Aquí puedes agregar lógica adicional según tus necesidades, como clonar el repositorio, etc.
    
        else
          @upload_error = 'Por favor, selecciona un archivo del repositorio para subir.'
        end
    
        render 'new_repository'
      end



      
end