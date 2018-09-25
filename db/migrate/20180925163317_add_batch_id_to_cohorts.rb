class AddBatchIdToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :batch_id, :integer
  end
end
