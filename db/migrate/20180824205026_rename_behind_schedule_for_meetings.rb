class RenameBehindScheduleForMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :behind_schedule?, :behind_schedule
  end
end
