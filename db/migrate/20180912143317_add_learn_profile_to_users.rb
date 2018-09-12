class AddLearnProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :learn_profile, :string
  end
end
