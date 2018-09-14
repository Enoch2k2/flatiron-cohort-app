class UserPolicy < ApplicationPolicy 
  attr_accessor :user, :user_record

  def initialize(user, user_record)
    @user = user 
    @user = user_record
  end

  def update? 
    user == user_record
  end
end