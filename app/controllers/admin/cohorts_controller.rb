class Admin::CohortsController < ApplicationController
  before_action :authorize_name
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  def index
    authorize_user("index?")
  end


  def show
    authorize_user("show?")
  end

  def edit
    authorize_user("update?")
  end

  def update
    authorize_user("update?")
    if @cohort.update(cohort_params)
      flash[:success] = "Successfully Updated #{@cohort.name}"
      redirect_to admin_cohorts_path
    else
      @error_messages = @cohort.errors.full_messages
      render :edit
    end
  end

  def destroy
    authorize_user("destroy?")
    @cohort.destroy
    flash[:success] = "Successfully Deleted #{@cohort.name}"
    redirect_to admin_cohorts_path
  end

  

  private

    def authorize_name
      redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
    end
    
    def authorize_user(method_name)
      unless Admin::CohortPolicy.new(current_user, @cohort).send(method_name)
        flash[:warning] = "You are not authorized to preform this action"
        redirect_to admin_cohorts_path
      end
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:id]) if params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id)
    end
end