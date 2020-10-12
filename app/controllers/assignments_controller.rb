class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # GET /assignments
  # GET /assignments.json
  def setSPPD
    Assignment.update(params[:assignment_id], perjalanan_dinas: params[:perjalanan_dinas])
    redirect_back(fallback_location: root_path, notice: "SPPD was created.")
  end

  def detail
    @assignment = Assignment.includes(:position, :service_type, :assignment_place).where('assignments.id = ?', params[:assignment_id])
    @fileAssignment = Assignment.find(params[:assignment_id])
    @getApprove = ApproveStatus.find_by_parent_assignment_id(@assignment.first.parent_id.to_s)
    @getHistory = HistoryAssignment.where('parent_assignment_id = ?',@assignment.first.parent_id.to_s).select('*')
  end

  def index
    if current_user.roles.any? { |r| r.name == "Approve1" or r.name == "Approve2" }
      @assignments = Assignment.includes(:position, :service_type, :assignment_place).where('assignments.assignment_place_id = ?', current_user.assignment_place_id)
    else
      @assignments = Assignment.includes(:position, :service_type, :assignment_place)
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    respond_to do |format|
      @assignment.user_mengajukan = current_user.id
      if @assignment.save
        @get = Assignment.last
        format.html { redirect_to detail_assignments_path(@get.id), notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      @getParent = Assignment.find(params[:id])
      @getHistory = HistoryAssignment.where(parent_assignment_id: @getParent.parent_id).select('id').last
      if @getHistory.present?
        HistoryAssignment.update(@getHistory.id, status_info: "terkonfirm")
      end
      
      if @assignment.update(assignment_params)
        format.html { redirect_to detail_assignments_path(params[:id]), notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_file
    @attachment = ActiveStorage::Attachment.find(params[:attachment_id])
    @attachment.purge # or use purge_later
    redirect_back(fallback_location: request.referer)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:nama, :position_id, :satuan_kerja, :service_type_id, :spesifik_output, :assignment_place_id, :pihak_ketiga, :lama_penugasan, :nama_tugas, :perjalanan_dinas, :user_mengajukan, file_assignment: [])
  end
end
