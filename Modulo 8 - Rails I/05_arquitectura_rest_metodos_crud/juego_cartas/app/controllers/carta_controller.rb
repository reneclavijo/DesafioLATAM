class CartaController < ApplicationController
  before_action :set_cartum, only: %i[ show edit update destroy ]

  # GET /carta or /carta.json
  def index
    @carta = Cartum.all
  end

  # GET /carta/1 or /carta/1.json
  def show
  end

  # GET /carta/new
  def new
    @cartum = Cartum.new
  end

  # GET /carta/1/edit
  def edit
  end

  # POST /carta or /carta.json
  def create
    @cartum = Cartum.new(cartum_params)

    respond_to do |format|
      if @cartum.save
        format.html { redirect_to cartum_url(@cartum), notice: "Cartum was successfully created." }
        format.json { render :show, status: :created, location: @cartum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cartum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carta/1 or /carta/1.json
  def update
    respond_to do |format|
      if @cartum.update(cartum_params)
        format.html { redirect_to cartum_url(@cartum), notice: "Cartum was successfully updated." }
        format.json { render :show, status: :ok, location: @cartum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cartum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carta/1 or /carta/1.json
  def destroy
    @cartum.destroy

    respond_to do |format|
      format.html { redirect_to carta_url, notice: "Cartum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartum
      @cartum = Cartum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cartum_params
      params.require(:cartum).permit(:nombre, :descripcion)
    end
end
