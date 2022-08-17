class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon, :string
    add_column :users, :profile, :text
  end
end
