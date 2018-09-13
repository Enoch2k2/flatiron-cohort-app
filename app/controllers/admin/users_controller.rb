class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def edit 
  end

  def update 
    if @user.update(user_params)
      redirect_to admin_users_path
    else  
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
    authorize @user
    redirect_to admin_users_path unless @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, role_ids: [])
  end

end