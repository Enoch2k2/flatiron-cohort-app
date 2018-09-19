class Admin::CohortPolicy < ApplicationPolicy
  attr_reader :user, :cohort_record

  def initialize(user, cohort_record)
    @user = user 
    @cohort_record = cohort_record
  end

  def index?
    user.admin?
  end

  def show?
    index?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end