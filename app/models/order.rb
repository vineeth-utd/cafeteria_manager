class Order < ActiveRecord::Base
  has_many :orderitems
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.being_created
    all.where("status= ?", "being_created").first
  end

  def self.conf_and_del
    all.where.not("status= ?", "being_created")
  end
  def self.pending_orders
    all.where("status= ?", "order_confirmed")
  end
end
