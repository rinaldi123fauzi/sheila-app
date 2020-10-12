class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json
  def index
   @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:username].present?
      @user = User.new(user_params)
      @user.username = params[:username]
      ldap = Net::LDAP.new :host => '192.168.60.159',
                           :port => 389,
                           :auth => {
                               :method => :simple,
                               :username => "cn=manager, dc=pgn-solution, dc=co, dc=id",
                               :password => "4lh4mdul1ll4h"
                           }
      filter = Net::LDAP::Filter.eq("cn", "#{params[:username]}")
      treebase = "dc=pgn-solution, dc=co, dc=id"
      ldap.search(:base => treebase, :filter => filter) do |entry|
        @email = entry["mail"].map(&:inspect).join(', ').gsub('"', '')
        @password = entry["userpassword"].map(&:inspect).join(', ').gsub('"', '')
        # if current_user.username == entry["sn"].map(&:inspect).join(', ').gsub('"', '')
        #   login_activity current_user.nama + " has been logout "
        # end
      end
      @user.email = "#{@email}"
      @user.password = "#{@password}"
      @user.name = params[:user][:name]
      @user.role_ids = params[:user][:role_ids]
      @user.save
      bypass_sign_in current_user
      redirect_to users_path, notice: 'User was successfully created.'
    else
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'User was successfully created.' }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def changePassword
    User.update(params[:id], password: params[:password])
    redirect_back(fallback_location: root_path, notice: "Password has changed.")
  end

  def update
    @user = User.find(params[:id])
    begin
      @user.name = params[:user][:name]
      @user.username = params[:user][:username]
      @user.username = params[:user][:username]
      if params[:user][:password].present?
        @user.password = params[:user][:password]
      end
      @user.role_ids = params[:user][:role_ids]
      @user.assignment_place_id = params[:user][:assignment_place_id]
      @user.save
      redirect_to users_path, notice: 'User was successfully updated.'
    rescue ArgumentError
      redirect_to root_path, notice: 'Cannot Execute'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :assignment_place_id, role_ids: [])
  end
end
