class Order < ActiveRecord::Base
  has_many :orderitems
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.being_created
    where("status = ?", "being_created").first
  end

  def self.conf_and_del
    where.not("status = ?", "being_created")
  end

  def self.get_pending_orders
    where("status = ?", "order_confirmed")
  end

  def self.is_delivered?
    if status == "delivered"
      true
    else
      false
    end
  end

  def status_tostring
    if status == "delivered"
      if delivered_at
        "Delivered on #{delivered_at.strftime("%-d %b,%Y")} at #{delivered_at.strftime("%I:%M %P")}"
      end
    elsif status == "being_created"
      "Being Created"
    else
      "Order Confirmed"
    end
  end

  def totalprice
    price = 0
    orderitems.each { |item| price = price + item.menu_item_price }
    price
  end
end
