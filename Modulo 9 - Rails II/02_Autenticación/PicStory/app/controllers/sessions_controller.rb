class SessionsController < ApplicationController
  before_action :necesito_estar_autenticado!, only: :destroy
  # GET /sessions/new 
  # formulario para iniciar sesión
  def new
  end

  # POST /sessions
  # lógica para iniciar sesión
  def create
    # obtener el correo del usuario
    user_email = params[:email]
    # buscar el usuario en nuestra BD
    user = User.find_by(email: user_email)
    # si el usuario existe, preguntamos por la contraseña
    if user
      if user.authenticate(params[:password])
        #   Si la contraseña esta buena, le pasamos una cookie o session
        session[:user_id] = user.id
        redirect_to root_path
      else
        #   Sino esta bien la contraseña un error
        flash[:session_error] = "Error al iniciar sesión"
        render :new        
      end
    else
      # sino pues mostramos un error
      flash[:session_error] = "Error al iniciar sesión"
      render :new        
    end
  end

  # DELETE /session/:id
  # lógica para cerrar sesión
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
