require 'securerandom'

class StudentsController < ApplicationController
  before_action :authorize_name
  before_action :authorize_user
  before_action :set_user
  before_action :set_cohort
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def new
    @student = User.new
  end

  def show

  end

  def create
    student = User.new(student_params)
    student.password = SecureRandom.hex
    if student.save
      student.update(roles: [Role.find_by(name: "Student")])
      student.student_cohorts.create(cohort_id: cohort_params[:id])
      redirect_to user_cohort_path(@user, @cohort)
    else
      redirect_to user_cohort_new_student_path(@user, @cohort)
    end
  end

  def edit 
  end

  def update 
    if @student.update(student_params)
      redirect_to user_cohort_student_path(@student)
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find_by_id(params[:user_id]) if params[:user_id]
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
