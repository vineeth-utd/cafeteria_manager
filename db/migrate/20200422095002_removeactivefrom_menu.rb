class RemoveactivefromMenu < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :active_menu
  end
end
