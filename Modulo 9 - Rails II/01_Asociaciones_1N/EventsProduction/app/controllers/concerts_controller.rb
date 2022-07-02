class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[ show edit update destroy ]

  # GET /concerts or /concerts.json
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1 or /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
    asignar_bandas
  end

  # GET /concerts/1/edit
  def edit
    asignar_bandas
  end

  # POST /concerts or /concerts.json
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to concert_url(@concert), notice: "Concert was successfully created." }
        format.json { render :show, status: :created, location: @concert }
      else
        asignar_bandas
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1 or /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to concert_url(@concert), notice: "Concert was successfully updated." }
        format.json { render :show, status: :ok, location: @concert }
      else
        asignar_bandas
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1 or /concerts/1.json
  def destroy
    @concert.destroy

    respond_to do |format|
      format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:attendance, :date, :capacity, :group_id)
    end

    def asignar_bandas
      @groups = Group.all
    end
end
