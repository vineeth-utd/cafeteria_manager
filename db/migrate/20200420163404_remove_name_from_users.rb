class RemoveNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    remove_column :users, :role
  end
end
