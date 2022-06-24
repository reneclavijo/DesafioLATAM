class JuegosController < ApplicationController
  # GET /juegos
  def listar
    @juegos = Juego.all
  end

  # GET /juegos/:id
  # GET /juegos/3 
  def mostrar
    @juego = Juego.find(params[:id])
  end

  # GET /juegos/nuevo
  def nuevo
    @juego = Juego.new
  end

  # GET /juegos/:id/editar
  # GET /juegos/3/editar
  def editar
    @juego = Juego.find(params[:id])
  end

  # POST /juegos
  def crear
    # parámetros fuertes
    juego_params = params.require(:juego).permit(:nombre, :ediciones, :lanzamiento)
    @juego = Juego.new(juego_params) # asignamos el valor del formulario al objeto
    if @juego.save
      redirect_to action: :listar
    else
      render :nuevo
    end
  end

  # PUT|PATCH /juegos/:id
  # PUT|PATCH /juegos/3
  def actualizar
    # 1. Buscar lo que vamos a actualizar
    @juego = Juego.find(params[:id])
    # 2. Asignar los nuevos valores
    juego_params = params.require(:juego).permit(:nombre, :ediciones, :lanzamiento)
    # 3. Guardar los cambios
    if @juego.update(juego_params)
      redirect_to juego_path(@juego)
    else
      render :editar
    end
  end

  # DELETE /juegos/:id
  # DELETE /juegos/3
  def eliminar
    # 1. Buscar lo que voy a eliminar
    @juego = Juego.find(params[:id])
    # 2. Eliminarlo
    # 3. Preguntar si todo bien
    if @juego.destroy
      redirect_to action: :listar
    else
      render :mostrar
    end
  end
end
