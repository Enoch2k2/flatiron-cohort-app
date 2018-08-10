class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def edit
    redirect_to root_path if !user_signed_in? || @user != current_user
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_path(@user)
    end
  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
