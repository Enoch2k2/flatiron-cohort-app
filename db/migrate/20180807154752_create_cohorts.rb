class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.integer :instructor_id, foreign_key: true
      t.timestamps
    end
  end
end
