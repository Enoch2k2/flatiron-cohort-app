class CohortPolicy < ApplicationPolicy 
  attr_accessor :user, :cohort

  def initialize(user, cohort)
    @user = user 
    @cohort = cohort
  end

  def index? 
    true 
  end

  def update?
    user.instructor? && cohort.instructor == user
  end
  
  def show?
    update?
  end

  def destroy?
    update?
  end
end