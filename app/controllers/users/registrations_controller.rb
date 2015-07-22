class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  before_filter :configure_permitted_parameters

  layout 'pages', except: :edit
  layout 'application', only: :edit

  def create
    @user = User.new(user_params)
    @user.role_id = user_params[:role_id]
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to controller: 'registrations', action: 'new' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    super
  end

  def edit
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
  end
end
