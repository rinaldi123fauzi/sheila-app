class ActivityTitlesController < ApplicationController
  before_action :set_activity_title, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # GET /activity_titles
  # GET /activity_titles.json
  def index
    @activity_titles = ActivityTitle.all
  end

  # GET /activity_titles/1
  # GET /activity_titles/1.json
  def show
  end

  # GET /activity_titles/new
  def new
    @activity_title = ActivityTitle.new
  end

  # GET /activity_titles/1/edit
  def edit
  end

  # POST /activity_titles
  # POST /activity_titles.json
  def create
    @activity_title = ActivityTitle.new(activity_title_params)

    respond_to do |format|
      if @activity_title.save
        format.html { redirect_to @activity_title, notice: 'Activity title was successfully created.' }
        format.json { render :show, status: :created, location: @activity_title }
      else
        format.html { render :new }
        format.json { render json: @activity_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_titles/1
  # PATCH/PUT /activity_titles/1.json
  def update
    respond_to do |format|
      if @activity_title.update(activity_title_params)
        format.html { redirect_to @activity_title, notice: 'Activity title was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_title }
      else
        format.html { render :edit }
        format.json { render json: @activity_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_titles/1
  # DELETE /activity_titles/1.json
  def destroy
    @activity_title.destroy
    respond_to do |format|
      format.html { redirect_to activity_titles_url, notice: 'Activity title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_title
      @activity_title = ActivityTitle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_title_params
      params.require(:activity_title).permit(:name)
    end
end
