class ApproveStatusesController < ApplicationController
  before_action :set_approve_status, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # Untuk Timesheet
  after_action :setApproveHistory, only: [:doApprove]
  after_action :setRejectHistory, only: [:doReject]
  after_action :setInfoHistory, only: [:createInfo]

  #Untuk Assignment
  after_action :setAssignmentApproveHistoryApprove1, only: [:createTimesheet]
  after_action :setAssignmentApproveHistory, only: [:doApproveAssignment]
  after_action :setAssignmentRejectHistory, only: [:doRejectAssignment]
  after_action :setAssignmentInfoHistory, only: [:createInfoAssignment]


  after_action :setApproveByApproval1, only: [:createTimesheet]
  # GET /approve_statuses
  # GET /approve_statuses.json

  def createTimesheet
    selesai_jam = params[:jam_selesai].split(':')
    get_selesai_jam = selesai_jam[0]

    mulai_jam = params[:jam_mulai].split(':')
    get_mulai_jam = mulai_jam[0]

    selesai_menit = params[:jam_selesai].split(':')
    get_selesai_menit = selesai_menit[1]

    mulai_menit = params[:jam_mulai].split(':')
    get_mulai_menit = mulai_menit[1]


    t_hour = get_selesai_jam.to_i - get_mulai_jam.to_i
    t_minute = get_selesai_menit.to_i - get_mulai_menit.to_i
    sec = t_hour * 60 + t_minute

    @splitDate = params[:tanggal].split('-')
    @date = @splitDate[0].to_s + @splitDate[1].to_s + @splitDate[2].to_s

    @lokasi_tugas = PersonilDetail.find_by_user_id(params[:personil_asantie])

    Timesheet.create!(
        tanggal: params[:tanggal],
        user_id: params[:personil_asantie],
        parent_id: @date + params[:personil_asantie],
        activity_title_id: params[:judul_aktivitas],
        isi_aktivitas: params[:isi_aktivitas],
        lokasi_kerja: params[:lokasi_kerja],
        jam_mulai: params[:jam_mulai],
        jam_selesai: params[:jam_selesai],
        assignment_place_id: @lokasi_tugas.assignment_place_id,
        activity_output_id: params[:output_aktivitas],
        minute_total: sec
    )
    @tertuju = "Approve2"
    redirect_back(fallback_location: root_path, :notice => "Data has created")
  end

  def doApproveAssignment #Buat Assignment
    if current_user.roles.any? { |r| r.name == "Approve2" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status2: "approved")
      @tertuju = "Approve3"
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status3: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "PM" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(statuspm: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status4: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def doRejectAssignment #Buat Assignment
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status1: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status2: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status3: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @approve_status.update(status4: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def createInfoAssignment #Buat Assignment
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @info_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @info_status.update(info1: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @info_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @info_status.update(info2: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @info_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @info_status.update(info3: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "PM" }
      @info_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @info_status.update(infopm: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @info_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_id])
      @info_status.update(info4: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def doApprove #Buat Timesheet
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status1: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
      @tertuju = "Approve2"
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status2: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
      @tertuju = "Approve3"
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status3: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
      @tertuju = "Approve4"
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status4: "approved")
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def doReject #Buat Timesheet
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status1: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status2: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status3: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @approve_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @approve_status.update(status4: "rejected")
      @approve_status.update(reject_by: current_user.username)
      @approve_status.update(alasan: params[:alasan])
      @approve_status.update(deskripsi: params[:deskripsi])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def createInfo #Buat Timesheet
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @info_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @info_status.update(info1: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @info_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @info_status.update(info2: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve3" }
      @info_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @info_status.update(info3: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    elsif current_user.roles.any? { |r| r.name == "Approve4" }
      @info_status = ApproveStatus.find_by_parent_timesheet_id(params[:parent_id])
      @info_status.update(info4: params[:info])
      redirect_back(fallback_location: root_path, :notice => "Data has created")
    end
  end

  def index
    @approve_statuses = ApproveStatus.all
  end

  # GET /approve_statuses/1
  # GET /approve_statuses/1.json
  def show
  end

  # GET /approve_statuses/new
  def new
    @approve_status = ApproveStatus.new
  end

  # GET /approve_statuses/1/edit
  def edit
  end

  # POST /approve_statuses
  # POST /approve_statuses.json
  def create
    @approve_status = ApproveStatus.new(approve_status_params)

    respond_to do |format|
      if @approve_status.save
        format.html { redirect_to @approve_status, notice: 'Approve status was successfully created.' }
        format.json { render :show, status: :created, location: @approve_status }
      else
        format.html { render :new }
        format.json { render json: @approve_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approve_statuses/1
  # PATCH/PUT /approve_statuses/1.json
  def update
    respond_to do |format|
      if @approve_status.update(approve_status_params)
        format.html { redirect_to @approve_status, notice: 'Approve status was successfully updated.' }
        format.json { render :show, status: :ok, location: @approve_status }
      else
        format.html { render :edit }
        format.json { render json: @approve_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approve_statuses/1
  # DELETE /approve_statuses/1.json
  def destroy
    @approve_status.destroy
    respond_to do |format|
      format.html { redirect_to approve_statuses_url, notice: 'Approve status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Untuk History Timesheet
  def setApproveHistory
    @getBeforeStatus = HistoryTimesheet.where('parent_timesheet_id = ? and status_info = ?', params[:parent_id], "pending_approve").last
    @update = HistoryTimesheet.find(@getBeforeStatus.id)
    @update.update(status_info: "Approved")
    HistoryTimesheet.create!(
        parent_timesheet_id: params[:parent_id],
        status: "approved",
        by: current_user.name,
        status_info: "pending_approve",
        tertuju_info: @tertuju
    )
  end

  def setRejectHistory
    HistoryTimesheet.create!(
        parent_timesheet_id: params[:parent_id],
        status: "rejected",
        by: current_user.name,
        alasan: params[:alasan],
        deskripsi: params[:deskripsi]
    )
  end

  def setInfoHistory
    HistoryTimesheet.create!(
        parent_timesheet_id: params[:parent_id],
        status: "pending",
        by: current_user.name,
        info: params[:info],
        status_info: "konfirm",
        tertuju_info: params[:tertuju_info]
    )
  end

  # Untuk History Assignment
  def setAssignmentApproveHistoryApprove1
    @getBeforeStatus = HistoryAssignment.where('parent_assignment_id = ? and status_info = ?', params[:parent_assignment_id], "pending_approve").last
    @update = HistoryAssignment.find(@getBeforeStatus.id)
    @update.update(status_info: "Approved")

    @getAssignment = Assignment.find_by_parent_id(params[:parent_assignment_id])
    HistoryAssignment.create!(
        parent_assignment_id: params[:parent_assignment_id],
        status: "approved",
        by: current_user.name,
        id_assignment: @getAssignment.id,
        status_info: "pending_approve",
        tertuju_info: @tertuju
    )
  end

  def setAssignmentApproveHistory
    @getBeforeStatus = HistoryAssignment.where('parent_assignment_id = ? and status_info = ?', params[:parent_id], "pending_approve").last
    @update = HistoryAssignment.find(@getBeforeStatus.id)
    @update.update(status_info: "Approved")

    @getAssignment = Assignment.find_by_parent_id(params[:parent_id])
    HistoryAssignment.create!(
        parent_assignment_id: params[:parent_id],
        status: "approved",
        by: current_user.name,
        id_assignment: @getAssignment.id,
        status_info: "pending_approve",
        tertuju_info: @tertuju
    )
  end

  def setAssignmentRejectHistory
    @getAssignment = Assignment.find_by_parent_id(params[:parent_id])
    HistoryAssignment.create!(
        parent_assignment_id: params[:parent_id],
        status: "rejected",
        by: current_user.name,
        alasan: params[:alasan],
        deskripsi: params[:deskripsi],
        id_assignment: @getAssignment.id
    )
  end

  def setAssignmentInfoHistory
    @getAssignment = Assignment.find_by_parent_id(params[:parent_id])
    HistoryAssignment.create!(
        parent_assignment_id: params[:parent_id],
        status: "pending",
        by: current_user.name,
        info: params[:info],
        status_info: "konfirm",
        tertuju_info: params[:tertuju_info],
        id_assignment: @getAssignment.id
    )
  end

  def setApproveByApproval1
      @getLastTimesheet = Timesheet.last
      @approve_status = ApproveStatus.find_by_parent_assignment_id(params[:parent_assignment_id])
      @approve_status.update(parent_timesheet_id: @getLastTimesheet.parent_id)
      @approve_status.update(timesheet_id: @getLastTimesheet.id)
      @approve_status.update(status1: "approved")
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_approve_status
    @approve_status = ApproveStatus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def approve_status_params
    params.require(:approve_status).permit(:parent_timesheet_id, :approve_by, :status1, :status2, :status3, :status4, :statuspm, :info1, :info2, :info3, :info4, :string, :infopm, :alasan, :deskripsi, :reject_by, :timesheet_id)
  end
end
