class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  private
    def authorize_name
      redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
    end
    
    def authorize_user
      redirect_to root_path if !user_signed_in? || !current_user.admin? || !current_user.instructor?
    end
end
