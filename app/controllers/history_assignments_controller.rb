class HistoryAssignmentsController < ApplicationController
  before_action :set_history_assignment, only: [:show, :edit, :update, :destroy]

  # GET /history_assignments
  # GET /history_assignments.json
  def index
    @history_assignments = HistoryAssignment.all
  end

  # GET /history_assignments/1
  # GET /history_assignments/1.json
  def show
  end

  # GET /history_assignments/new
  def new
    @history_assignment = HistoryAssignment.new
  end

  # GET /history_assignments/1/edit
  def edit
  end

  # POST /history_assignments
  # POST /history_assignments.json
  def create
    @history_assignment = HistoryAssignment.new(history_assignment_params)

    respond_to do |format|
      if @history_assignment.save
        format.html { redirect_to @history_assignment, notice: 'History assignment was successfully created.' }
        format.json { render :show, status: :created, location: @history_assignment }
      else
        format.html { render :new }
        format.json { render json: @history_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_assignments/1
  # PATCH/PUT /history_assignments/1.json
  def update
    respond_to do |format|
      if @history_assignment.update(history_assignment_params)
        format.html { redirect_to @history_assignment, notice: 'History assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_assignment }
      else
        format.html { render :edit }
        format.json { render json: @history_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_assignments/1
  # DELETE /history_assignments/1.json
  def destroy
    @history_assignment.destroy
    respond_to do |format|
      format.html { redirect_to history_assignments_url, notice: 'History assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_assignment
      @history_assignment = HistoryAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def history_assignment_params
      params.require(:history_assignment).permit(:parent_assignment_id, :status, :by, :alasan, :deskripsi, :info, :status_info, :tertuju_info)
    end
end
