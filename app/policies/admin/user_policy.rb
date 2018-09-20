class Admin::UserPolicy < ApplicationPolicy
  attr_reader :user, :user_record

  def initialize(user, user_record)
    @user = user 
    @user_record = user_record
  end

  def index?
    user.admin?
  end

  def show?
    index?
  end

  def edit?
    user.admin?
  end

  def update?
    index?
  end

  def destroy?
    user.admin?
  end
end