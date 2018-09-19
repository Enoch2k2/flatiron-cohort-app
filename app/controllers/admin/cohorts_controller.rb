class Admin::CohortsController < ApplicationController
  before_action :authorize_name
  before_action :authorize_user
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  def index
  end


  def show
  end

  def edit
    authorize @cohort
  end

  def update
    authorize @cohort
    if @cohort.update(cohort_params)
      redirect_to admin_cohorts_path
    else
      @error_messages = @cohort.errors.full_messages
      render :edit
    end
  end

  def destroy
    authorize @cohort
    @cohort.destroy
    flash[:success] = "Successfully Deleted #{@cohort.name}"
    redirect_to admin_cohorts_path
  end

  

  private

    def authorize_name
      redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
    end
    
    def authorize_user
      redirect_to root_path if !user_signed_in? || !current_user.admin? || !current_user.instructor?
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:id]) if params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id)
    end
end