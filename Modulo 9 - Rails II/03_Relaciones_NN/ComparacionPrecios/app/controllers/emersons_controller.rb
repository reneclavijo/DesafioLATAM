class EmersonsController < ApplicationController
  before_action :set_emerson, only: %i[ show edit update destroy ]

  # GET /emersons or /emersons.json
  def index
    @emersons = Emerson.all
  end

  # GET /emersons/1 or /emersons/1.json
  def show
  end

  # GET /emersons/new
  def new
    @emerson = Emerson.new
  end

  # GET /emersons/1/edit
  def edit
  end

  # POST /emersons or /emersons.json
  def create
    @emerson = Emerson.new(emerson_params)

    respond_to do |format|
      if @emerson.save
        format.html { redirect_to emerson_url(@emerson), notice: "Emerson was successfully created." }
        format.json { render :show, status: :created, location: @emerson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emerson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emersons/1 or /emersons/1.json
  def update
    respond_to do |format|
      if @emerson.update(emerson_params)
        format.html { redirect_to emerson_url(@emerson), notice: "Emerson was successfully updated." }
        format.json { render :show, status: :ok, location: @emerson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emerson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emersons/1 or /emersons/1.json
  def destroy
    @emerson.destroy

    respond_to do |format|
      format.html { redirect_to emersons_url, notice: "Emerson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emerson
      @emerson = Emerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emerson_params
      params.require(:emerson).permit(:name)
    end
end
