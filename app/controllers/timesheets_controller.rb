class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  after_action :destroyChild, only: [:destroyParent]

  # GET /timesheets
  # GET /timesheets.json
  def reportSheet
    if current_user.roles.any? { |r| r.name == "Approve1" }
      @timesheets = Timesheet.where('timesheets.assignment_place_id = ? and user_id = ? and tanggal BETWEEN ? AND ?', current_user.assignment_place_id, params[:personil], "#{params[:start]}", "#{params[:end]}").select('*').order('timesheets.tanggal ASC')
      if @timesheets.present?
        @getPersonilDetail = PersonilDetail.left_outer_joins(:position, :assignment_place).where('personil_details.user_id = ?', @timesheets.first.user_id.to_i).select('*,
          assignment_places.name AS nameassignmentplaces, positions.name AS namepositions
        ')
      end
      @start = params[:start]
      @end = params[:end]
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @timesheets = Timesheet.where('timesheets.assignment_place_id = ? and user_id = ? and tanggal BETWEEN ? AND ?', current_user.assignment_place_id, params[:personil], "#{params[:start]}", "#{params[:end]}").select('*').order('timesheets.tanggal ASC')
      if @timesheets.present?
        @getPersonilDetail = PersonilDetail.left_outer_joins(:position, :assignment_place).where('personil_details.user_id = ?', @timesheets.first.user_id.to_i).select('*,
          assignment_places.name AS nameassignmentplaces, positions.name AS namepositions
        ').order('timesheets.tanggal ASC')
      end
      @start = params[:start]
      @end = params[:end]
    elsif current_user.roles.any? { |r| r.name == "Personil ASANTIE" }
      @timesheets = Timesheet.where('user_id = ? and tanggal BETWEEN ? AND ?', current_user.id, "#{params[:start]}", "#{params[:end]}").select('*').order('timesheets.tanggal ASC')
      @getPersonilDetail = PersonilDetail.left_outer_joins(:position, :assignment_place).where('personil_details.user_id = ?', @timesheets.first.user_id.to_i).select('*,
      assignment_places.name AS nameassignmentplaces, positions.name AS namepositions
    ')
      @personil = params[:personil]
      @start = params[:start]
      @end = params[:end]
    else
      @timesheets = Timesheet.where('user_id = ? and tanggal BETWEEN ? AND ?', params[:personil], "#{params[:start]}", "#{params[:end]}").select('*').order('timesheets.tanggal ASC')
      @getPersonilDetail = PersonilDetail.left_outer_joins(:position, :assignment_place).where('personil_details.user_id = ?', @timesheets.first.user_id.to_i).select('*,
      assignment_places.name AS nameassignmentplaces, positions.name AS namepositions
    ')
      @personil = params[:personil]
      @start = params[:start]
      @end = params[:end]
    end

    if params[:export_to] == "pdf"
      respond_to do |format|
        format.html { head :no_content }
        format.pdf do
          # render :orientation => 'Landscape',:encoding => "utf8", :layout => "pdf_layout", pdf: "assessment_pdf.pdf"
          # render :orientation => 'Landscape', :encoding => "utf8", :layout => "pdf_layout", pdf: "reportQMS_DAK_" + Time.now.strftime('%Y%m%d%H%I%S'), :footer => {:right => '[page] of [topage]', :font_size => 8}, margin: {bottom: 4,
          #                                                                                                                                                                                                                     left: 2,
          #                                                                                                                                                                                                                     right: 2}
          render :orientation => 'Landscape', :encoding => "utf8", :layout => "pdf", pdf: "reportTimesheet_" + Time.now.strftime('%Y%m%d%H%I%S') + ".pdf"
        end
      end
    elsif params[:export_to] == "excel"
      respond_to do |format|
        format.html
        format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="timesheets"' + '".xlsx"' }
      end
    end
  end

  def index
    if current_user.roles.any? { |r| r.name == "Personil ASANTIE" }
      @timesheets = Timesheet.left_outer_joins(:user, :activity_title, :activity_output).where('timesheets.user_id = ? ', current_user.id).select('DISTINCT ON(tanggal,timesheets.user_id) users.name AS nameusers, timesheets.tanggal, timesheets.parent_id')
    elsif current_user.roles.any? { |r| r.name == "Approve1" }
      @timesheets = Timesheet.left_outer_joins(:user, :activity_title, :activity_output).where('timesheets.assignment_place_id = ?', current_user.assignment_place_id).select('DISTINCT ON(tanggal,timesheets.user_id) users.name AS nameusers, timesheets.tanggal, timesheets.parent_id')
    elsif current_user.roles.any? { |r| r.name == "Approve2" }
      @timesheets = Timesheet.left_outer_joins(:user, :activity_title, :activity_output).where('timesheets.assignment_place_id = ?', current_user.assignment_place_id).select('DISTINCT ON(tanggal,timesheets.user_id) users.name AS nameusers, timesheets.tanggal, timesheets.parent_id')
    else
      @timesheets = Timesheet.left_outer_joins(:user, :activity_title, :activity_output).select('DISTINCT ON(tanggal,timesheets.user_id) users.name AS nameusers, timesheets.tanggal, timesheets.parent_id')
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show

  end

  def detail
    @timesheets = Timesheet.left_outer_joins(:user, :activity_title, :activity_output).where(parent_id: params[:parent_id]).select('
      activity_titles.name AS nameactivitytitles, isi_aktivitas, jam_mulai, jam_selesai, activity_outputs.name AS nameactivityoutputs,
      timesheets.user_id, tanggal, parent_id, timesheets.id AS idtimesheets, timesheets.activity_title_id, timesheets.lokasi_kerja, timesheets.activity_output_id
    ')
    @personil_detail_foto = PersonilDetail.find_by_user_id(@timesheets.first.user_id.to_i)

    @personil_detail = PersonilDetail.left_outer_joins(:assignment_place, :position).where(user_id: @personil_detail_foto.user_id).select('
      assignment_places.name AS nameassignmentplaces, positions.name AS namepositions, nomor_ponsel, email
    ')

    @getApprove = ApproveStatus.find_by_parent_timesheet_id(@timesheets.first.parent_id.to_i)

    @getHistory = HistoryTimesheet.where('parent_timesheet_id = ?',@timesheets.first.parent_id.to_s).select('*')
  end

  def editTimesheet
    @updateTimesheet = Timesheet.find(params[:id])
    @updateTimesheet.update(tanggal: params[:tanggal])
    @updateTimesheet.update(lokasi_kerja: params[:lokasi_kerja])
    @updateTimesheet.update(isi_aktivitas: params[:isi_aktivitas])

    if params[:jam_mulai].present?
      @updateTimesheet.update(jam_mulai: params[:jam_mulai])
    end

    if params[:jam_selesai].present?
      @updateTimesheet.update(jam_selesai: params[:jam_selesai])
    end

    if params[:judul_aktifitas].present?
      @updateTimesheet.update(activity_title_id: params[:judul_aktifitas])
    end

    if params[:output_aktifitas].present?
      @updateTimesheet.update(activity_output_id: params[:output_aktifitas])
    end

    @getHistory = HistoryTimesheet.where(parent_timesheet_id: @updateTimesheet.parent_id).select('id').last
    if @getHistory.present?
      HistoryTimesheet.update(@getHistory.id, status_info: "terkonfirm")
    end

    redirect_back(fallback_location: root_path, notice: "Timesheet was successfully updated.")
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.tanggal = params[:timesheet][:tanggal]

    @splitDate = params[:timesheet][:tanggal].split('-')
    @date = @splitDate[0].to_s + @splitDate[1].to_s + @splitDate[2].to_s

    @timesheet.parent_id = @date + params[:timesheet][:user_id]

    @getPlace = PersonilDetail.find_by_user_id(params[:timesheet][:user_id])
    @timesheet.assignment_place_id = @getPlace.assignment_place_id

    respond_to do |format|
      if @timesheet.save
        if params[:next_line]
          format.html { redirect_back(fallback_location: root_path, notice: "Timesheet was successfully created.") }
          format.json { render :show, status: :created, location: @timesheet }
        else
          format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully created.' }
          format.json { render :show, status: :created, location: @timesheet }
        end
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroyParent
    Timesheet.where(parent_id: "#{params[:parent_id]}").destroy_all
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, :notice => "Data has deleted.") }
      format.json { head :no_content }
    end
  end

  private

  def destroyChild
    HistoryTimesheet.where(parent_timesheet_id: "#{params[:parent_id]}").destroy_all
    ApproveStatus.where(parent_timesheet_id: "#{params[:parent_id]}").destroy_all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_timesheet
    @timesheet = Timesheet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def timesheet_params
    params.require(:timesheet).permit(:parent_id, :user_id, :tanggal, :activity_title_id, :isi_aktivitas, :jam_mulai, :jam_selesai, :lokasi_kerja, :activity_output_id, :assignment_place_id, :minute_total)
  end
end
