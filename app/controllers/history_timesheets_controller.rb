class HistoryTimesheetsController < ApplicationController
  before_action :set_history_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /history_timesheets
  # GET /history_timesheets.json
  def index
    @history_timesheets = HistoryTimesheet.all
  end

  # GET /history_timesheets/1
  # GET /history_timesheets/1.json
  def show
  end

  # GET /history_timesheets/new
  def new
    @history_timesheet = HistoryTimesheet.new
  end

  # GET /history_timesheets/1/edit
  def edit
  end

  # POST /history_timesheets
  # POST /history_timesheets.json
  def create
    @history_timesheet = HistoryTimesheet.new(history_timesheet_params)

    respond_to do |format|
      if @history_timesheet.save
        format.html { redirect_to @history_timesheet, notice: 'History timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @history_timesheet }
      else
        format.html { render :new }
        format.json { render json: @history_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_timesheets/1
  # PATCH/PUT /history_timesheets/1.json
  def update
    respond_to do |format|
      if @history_timesheet.update(history_timesheet_params)
        format.html { redirect_to @history_timesheet, notice: 'History timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_timesheet }
      else
        format.html { render :edit }
        format.json { render json: @history_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_timesheets/1
  # DELETE /history_timesheets/1.json
  def destroy
    @history_timesheet.destroy
    respond_to do |format|
      format.html { redirect_to history_timesheets_url, notice: 'History timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_timesheet
      @history_timesheet = HistoryTimesheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def history_timesheet_params
      params.require(:history_timesheet).permit(:parent_timesheet_id, :approve_status_id, :approve_by, :reject_by)
    end
end
