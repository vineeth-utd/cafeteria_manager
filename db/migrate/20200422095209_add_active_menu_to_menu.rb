class AddActiveMenuToMenu < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :active_menu, :boolean, null: false
  end
end
