class AddAddedToInstructorAppToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :added_to_instructor_app?, :boolean
  end
end
