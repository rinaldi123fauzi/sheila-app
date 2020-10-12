class ActivityOutputsController < ApplicationController
  before_action :set_activity_output, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # GET /activity_outputs
  # GET /activity_outputs.json
  def index
    @activity_outputs = ActivityOutput.all
  end

  # GET /activity_outputs/1
  # GET /activity_outputs/1.json
  def show
  end

  # GET /activity_outputs/new
  def new
    @activity_output = ActivityOutput.new
  end

  # GET /activity_outputs/1/edit
  def edit
  end

  # POST /activity_outputs
  # POST /activity_outputs.json
  def create
    @activity_output = ActivityOutput.new(activity_output_params)

    respond_to do |format|
      if @activity_output.save
        format.html { redirect_to @activity_output, notice: 'Activity output was successfully created.' }
        format.json { render :show, status: :created, location: @activity_output }
      else
        format.html { render :new }
        format.json { render json: @activity_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_outputs/1
  # PATCH/PUT /activity_outputs/1.json
  def update
    respond_to do |format|
      if @activity_output.update(activity_output_params)
        format.html { redirect_to @activity_output, notice: 'Activity output was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_output }
      else
        format.html { render :edit }
        format.json { render json: @activity_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_outputs/1
  # DELETE /activity_outputs/1.json
  def destroy
    @activity_output.destroy
    respond_to do |format|
      format.html { redirect_to activity_outputs_url, notice: 'Activity output was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_output
      @activity_output = ActivityOutput.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_output_params
      params.require(:activity_output).permit(:name)
    end
end
