class CohortsController < ApplicationController
  before_action :authorize_name
  # before_action :authorize_user
  before_action :set_user
  before_action :set_cohort, only: [:show, :edit, :update]

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
      render :new
    end
  end

  def show
  end

  def edit 
  end 

  def update 
    if @cohort.update(cohort_params)
      redirect_to user_cohort_path(@user, @cohort)
    else
      render :edit
    end
  end
  private

    def set_user
      @user = User.find_by_id(params[:user_id]) if params[:user_id]
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:id]) if params[:id]
      authorize @cohort
    end

    def cohort_params
      params.require(:cohort).permit(:name, :batch_id, :start_date, :end_date, :instructor_id)
    end
end
