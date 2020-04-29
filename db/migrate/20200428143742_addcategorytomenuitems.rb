class Addcategorytomenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :category, :string
  end
end
