class MeetingsController < ApplicationController
  before_action :authorize_name
  before_action :authorize_user
  before_action :set_user
  before_action :set_cohort
  before_action :set_student
  before_action :set_meeting, only: [:add_to_doc, :add_to_instructor_app, :destroy]

  def create
    @meeting = Meeting.new(meeting_params)
    
    if @meeting.save
      @meeting.update(added_to_instructor_app?: false)
      redirect_to user_cohort_student_path(@user, @cohort, @student)
    else
      render 'students/show'
    end
  end

  def add_to_instructor_app
    if @meeting.update(added_to_instructor_app?: true)
      redirect_to user_cohort_student_path(@user, @cohort, @student)
    else
      redirect_to user_cohort_student_path(@user, @cohort, @student)
    end
  end

  def destroy
    @meeting.delete
    redirect_to user_cohort_student_path(@user, @cohort, @student)
  end

   private

    def set_user
      @user = User.find_by_id(params[:user_id]) if params[:user_id]
    end

    def set_cohort
      @cohort = Cohort.find_by_id(params[:cohort_id]) if params[:cohort_id]
    end

    def set_student
      @student = User.find_by_id(params[:student_id]) if params[:student_id]
    end

    def set_meeting
      @meeting = Meeting.find_by_id(params[:id]) if params[:id]
    end

    def meeting_params
      params.require(:meeting).permit(:date, :time, :current_lesson, :completed_lessons, :struggling, :behind_schedule, :knowledge_check, :note, :user_id)
    end
end
