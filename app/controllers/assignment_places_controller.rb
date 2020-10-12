class AssignmentPlacesController < ApplicationController
  before_action :set_assignment_place, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # GET /assignment_places
  # GET /assignment_places.json
  def index
    @assignment_places = AssignmentPlace.all
  end

  # GET /assignment_places/1
  # GET /assignment_places/1.json
  def show
  end

  # GET /assignment_places/new
  def new
    @assignment_place = AssignmentPlace.new
  end

  # GET /assignment_places/1/edit
  def edit
  end

  # POST /assignment_places
  # POST /assignment_places.json
  def create
    @assignment_place = AssignmentPlace.new(assignment_place_params)

    respond_to do |format|
      if @assignment_place.save
        format.html { redirect_to @assignment_place, notice: 'Assignment place was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_place }
      else
        format.html { render :new }
        format.json { render json: @assignment_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_places/1
  # PATCH/PUT /assignment_places/1.json
  def update
    respond_to do |format|
      if @assignment_place.update(assignment_place_params)
        format.html { redirect_to @assignment_place, notice: 'Assignment place was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_place }
      else
        format.html { render :edit }
        format.json { render json: @assignment_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_places/1
  # DELETE /assignment_places/1.json
  def destroy
    @assignment_place.destroy
    respond_to do |format|
      format.html { redirect_to assignment_places_url, notice: 'Assignment place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_place
      @assignment_place = AssignmentPlace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_place_params
      params.require(:assignment_place).permit(:name)
    end
end
