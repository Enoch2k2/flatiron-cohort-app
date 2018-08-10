class WelcomeController < ApplicationController
  def index
    redirect_to edit_user_path(current_user) if user_signed_in? && current_user.first_name.nil?
  end
end
