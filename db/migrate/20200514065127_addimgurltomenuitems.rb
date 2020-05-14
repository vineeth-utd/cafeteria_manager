class Addimgurltomenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :imgurl, :string
  end
end
