module LoginHelper

  def instructor_login
    attrs = attributes_for(:instructor)
    instructor = create(:instructor)
    visit new_user_session_path
    fill_in "user_email", with: instructor.email
    fill_in "user_password", with: attrs[:password]
    submit_form
  end

  def admin_login
    attrs = attributes_for(:admin)
    admin = create(:admin)
    visit new_user_session_path
    fill_in "user_email", with: admin.email
    fill_in "user_password", with: attrs[:password]
    submit_form
  end

end
