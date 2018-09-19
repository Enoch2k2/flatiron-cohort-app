class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def edit 
  end

  def update 
    if @user.update(user_params)
      check_if_moved_cohorts
      redirect_to admin_users_path
    else  
      render :edit
    end
  end

  def destroy 
    authorize_user("destroy?")
    @user.destroy
    redirect_to admin_users_path, success: "User successfully deleted"
  end

  private

  def check_if_moved_cohorts
    if @user.current_cohort && !@user.cohorts.include?(@user.current_cohort)
      @user.update(cohort_ids: @user.cohort_ids.concat([@user.current_cohort.id]))
    end

    if @user.current_cohort && !@user.current_cohort.students.include?(@user)
      @user.current_cohort.update(student_ids: @user.current_cohort.students.concat([@user.id]))
    end
  end

  def authorize_user(method_name)
    unless Admin::UserPolicy.new(current_user, @user).send(method_name)
      flash[:warning] = "You are not authorized to preform this action"
      redirect_to admin_users_path
    end
  end
  
  def set_user 
    @user = User.find_by(id: params[:id])
    authorize @user
    redirect_to admin_users_path unless @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_cohort_id, role_ids: [])
  end

end