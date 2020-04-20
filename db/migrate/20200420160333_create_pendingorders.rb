class CreatePendingorders < ActiveRecord::Migration[6.0]
  def change
    create_table :pendingorders do |t|
      t.bigint :order_id
    end
  end
end
