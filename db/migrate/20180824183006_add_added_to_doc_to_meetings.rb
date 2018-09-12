class AddAddedToDocToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :added_to_doc?, :boolean
  end
end
