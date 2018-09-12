class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.belongs_to :user, foreign_key: true
      t.date :date
      t.string :time
      t.string :current_lesson
      t.integer :completed_lessons
      t.boolean :struggling?
      t.boolean :behind_schedule?
      t.integer :knowledge_check
      t.string :note

      t.timestamps
    end
  end
end
