module LoginHelper

  def instructor_login
    attrs = attributes_for(:instructor)
    create(:instructor)
    visit new_user_session_path
    fill_in "user_email", with: attrs[:email]
    fill_in "user_password", with: attrs[:password]
    submit_form
  end

  def admin_login
    
  end

end
