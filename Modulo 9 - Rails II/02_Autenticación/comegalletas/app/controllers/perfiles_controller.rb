class PerfilesController < ApplicationController
  before_action :validar_usuario, only: [:privado]

  def publico
  end

  def privado
  end
  
  # POST /iniciar_sesion
  def iniciar_sesion
    # 1. Recuperar el correo y buscar el usuario
    usuario = Usuario.find_by(correo: params[:correo])
    if usuario # preguntar si el usuario es diferente de nil
      if usuario.authenticate(params[:password])      
        #   4. Debemos crear la cookie con el id del usuario
        cookies[:autenticacion] = usuario.id
        redirect_to action: :privado
      else
        #   5. Si esta mal la contraseña mostrar mensaje
        flash[:error] = "Correo o contraseña están mal"
        render :publico
      end
    else
      # 2. Si NO existe, enviar el mensaje de error
      flash[:error] = "Correo o contraseña están mal"
      render :publico
    end
  end

  # DELETE /cerrar_sesion
  def cerrar_sesion
    # 1. Eliminar la cookie de autenticacion
    cookies.delete(:autenticacion)
    # 2. Redirigir hacia la vista de publico
    redirect_to action: :publico
  end


  private
  def validar_usuario
    # Preguntar si tenemos la cookie de autenticación
    if cookies[:autenticacion]
      # Recuperar el valor de la cookie
      id_usuario = cookies[:autenticacion]
      # Buscar el usuario
      @usuario = Usuario.find(id_usuario)
    else
      # Redireccionar a otra vista
      redirect_to action: :publico
    end
  end

end
