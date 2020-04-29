class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.being_created
    all.where("status= ?", "being_created").first
  end

  def self.pending_orders
    all.where("status= ?", "order_confirmed").first
  end
end
