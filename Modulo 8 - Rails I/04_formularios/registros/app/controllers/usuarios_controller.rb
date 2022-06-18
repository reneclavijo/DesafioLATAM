class UsuariosController < ApplicationController
  # GET /
  # La vista del formulario
  def registro
    
  end

  # POST /crear_usuario
  def crear
                    # Modelo
    @usuario_nuevo = Usuario.new(
      #del modelo   | de la vista
      nombre:         params[:nombre],
      apellido:       params[:apellido],
      correo:         params[:correo],
      password:       params[:password],
      color_favorito: params[:color_favorito]
    )
    if @usuario_nuevo.save
      # redirect_to usuarios_path # apunta al alias (as:)
      redirect_to action: :listar  # apunta al controlador usuarios y su método listar
    else
      # flash es un Hash para enviarse mensaje entre controladores y vistas
      flash[:error] = "Error al guardar al usuario"
      # toma prestada la vista registro
      render :registro
    end 
  end

  # GET /listar_usuarios
  def listar
    if params[:busqueda] && !params[:busqueda].empty?
      @lista_de_usuarios = Usuario.where(nombre: params[:busqueda])
    else
      @lista_de_usuarios = Usuario.all
    end
  end

end
