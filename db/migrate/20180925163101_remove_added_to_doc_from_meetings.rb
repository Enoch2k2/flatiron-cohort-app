class RemoveAddedToDocFromMeetings < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :added_to_doc?, :boolean
  end
end
