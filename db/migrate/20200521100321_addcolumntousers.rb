class Addcolumntousers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :bigint
    add_column :users, :address, :text
  end
end
