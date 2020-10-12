class PersonilDetailsController < ApplicationController
  before_action :set_personil_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  # GET /personil_details
  # GET /personil_details.json
  def index
    @personil_details = PersonilDetail.left_outer_joins(:assignment_place,:position).select('
    nama_lengkap, nama_panggilan, tim, assignment_places.name AS nameassignmentplaces, positions.name AS namepositions, nomor_ponsel, personil_details.email, personil_details.id AS idpersonildetails
    ')
  end

  # GET /personil_details/1
  # GET /personil_details/1.json
  def show
    @personil_detail = PersonilDetail.find(params[:id])
  end

  # GET /personil_details/new
  def new
    @personil_detail = PersonilDetail.new
  end

  # GET /personil_details/1/edit
  def edit
  end

  # POST /personil_details
  # POST /personil_details.json
  def create
    @personil_detail = PersonilDetail.new(personil_detail_params)

    respond_to do |format|
      if @personil_detail.save
        format.html { redirect_to personil_details_url, notice: 'Personil detail was successfully created.' }
        format.json { render :show, status: :created, location: @personil_detail }
      else
        format.html { render :new }
        format.json { render json: @personil_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personil_details/1
  # PATCH/PUT /personil_details/1.json
  def update
    respond_to do |format|
      if @personil_detail.update(personil_detail_params)
        format.html { redirect_to @personil_detail, notice: 'Personil detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @personil_detail }
      else
        format.html { render :edit }
        format.json { render json: @personil_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personil_details/1
  # DELETE /personil_details/1.json
  def destroy
    @personil_detail.destroy
    respond_to do |format|
      format.html { redirect_to personil_details_url, notice: 'Personil detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_photo
    @attachment = ActiveStorage::Attachment.find(params[:attachment_id])
    @attachment.purge # or use purge_later
    redirect_back(fallback_location: request.referer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personil_detail
      @personil_detail = PersonilDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personil_detail_params
      params.require(:personil_detail).permit(:nama_lengkap, :nama_panggilan, :user_id, :tim, :assignment_place_id, :position_id, :nomor_ponsel, :email, :username, :photo_personil)
    end
end
