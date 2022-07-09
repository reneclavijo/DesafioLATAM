class VinosController < ApplicationController
  before_action :set_vino, only: %i[ show edit update destroy ]

  # GET /vinos or /vinos.json
  def index
    @vinos = Vino.all
  end

  # GET /vinos/1 or /vinos/1.json
  def show
  end

  # GET /vinos/new
  def new
    @vino = Vino.new
    @cepas = Cepa.all
    @vino.ensamblajes.build
  end

  # GET /vinos/1/edit
  def edit
    @pos = 0
    if @vino.ensamblajes.count == 0
      @cepas = Cepa.all
      @vino.ensamblajes.build
    end
  end

  # POST /vinos or /vinos.json
  def create
    @vino = Vino.new(vino_params)

    respond_to do |format|
      if @vino.save
        format.html { redirect_to vino_url(@vino), notice: "Vino was successfully created." }
        format.json { render :show, status: :created, location: @vino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinos/1 or /vinos/1.json
  def update
    respond_to do |format|
      if @vino.update(vino_params)
        format.html { redirect_to vino_url(@vino), notice: "Vino was successfully updated." }
        format.json { render :show, status: :ok, location: @vino }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinos/1 or /vinos/1.json
  def destroy
    @vino.destroy

    respond_to do |format|
      format.html { redirect_to vinos_url, notice: "Vino was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vino
      @vino = Vino.includes(:cepas).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vino_params
      params.require(:vino).permit(:nombre, ensamblajes_attributes: [:id, :cepa_id, :porcentaje])
    end
end
