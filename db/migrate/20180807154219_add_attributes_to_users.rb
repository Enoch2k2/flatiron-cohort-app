class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :slack_username, :string
    add_column :users, :current_lesson, :string
    add_column :users, :completed_lessons, :integer, default: 0
  end
end
