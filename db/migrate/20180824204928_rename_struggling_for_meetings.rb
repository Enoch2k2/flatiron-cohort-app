class RenameStrugglingForMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :struggling?, :struggling
  end
end
