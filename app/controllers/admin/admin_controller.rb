class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin

  private 

  def verify_admin
    unless current_user.admin?
      flash[:error] = "You are not authorized to perform this action."
      redirect_to root_path unless current_user.admin?
    end
  end

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end

end