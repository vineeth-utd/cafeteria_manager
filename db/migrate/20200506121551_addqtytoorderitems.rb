class Addqtytoorderitems < ActiveRecord::Migration[6.0]
  def change
    add_column :orderitems, :qty, :int
  end
end
