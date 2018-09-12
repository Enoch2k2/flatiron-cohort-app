class Admin::StudentsController < ApplicationController
  before_action :authorize_name
  before_action :authorize_user
  before_action :set_cohort
  before_action :set_student, only: [:show]

  def show

  end

  private
    def authorize_name
      redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
    end
    
    def authorize_user
      redirect_to root_path if !user_signed_in? || !current_user.admin? || !current_user.instructor?
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:cohort_id]) if params[:cohort_id]
    end

    def set_student
      @student = User.find_by_id(params[:id]) if params[:id]
    end

    def student_params
      params.require(:user).permit(:first_name, :last_name, :slack_username, :learn_profile, :email, :cohort_id)
    end

    def cohort_params
      params.require(:cohort).permit(:id)
    end
end