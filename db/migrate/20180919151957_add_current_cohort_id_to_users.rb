class AddCurrentCohortIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_cohort_id, :integer
  end
end
