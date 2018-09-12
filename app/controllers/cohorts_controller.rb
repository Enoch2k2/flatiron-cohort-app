class CohortsController < ApplicationController
  before_action :authorize_name
  before_action :authorize_user
  before_action :set_user
  before_action :set_cohort, only: [:show]

  def index
  end

  def new
    @cohort = @user.cohorts.build
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to user_cohorts_path(@user)
    else
      redirect_to new_user_cohort_path(@user)
    end
  end

  def show
  end

  private

    def authorize_name
      redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
    end
    
    def authorize_user
      redirect_to root_path if !user_signed_in? || !current_user.admin? || !current_user.instructor?
    end

    def set_user
      @user = User.find_by_id(params[:user_id]) if params[:user_id]
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:id]) if params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id)
    end
end
