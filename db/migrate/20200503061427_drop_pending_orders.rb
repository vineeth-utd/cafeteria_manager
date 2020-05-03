class DropPendingOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :pendingorders
  end
end
