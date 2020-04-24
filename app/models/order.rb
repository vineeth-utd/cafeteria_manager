class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end
end
