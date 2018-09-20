class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def edit

  end

  def update 
    if @user.update(user_params)
      redirect_to admin_users_path, success: "User successfully updated"
    else
      @error_messages = @user.errors.full_messages
      render :edit
    end
  end

  def destroy 
    @user.destroy
    redirect_to admin_users_path, success: "User successfully deleted"
  end

  private
  
  def set_user 
    @user = User.find_by(id: params[:id])
    redirect_to admin_users_path unless @user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_cohort_attributes, role_ids: [])
  end

end