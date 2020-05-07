class Orderitem < ActiveRecord::Base
  belongs_to :order
  #belongs_to :menuitem

  def self.get_item_price(menuitem_name)
    find_by(menu_item_name: menuitem_name).menu_item_price
  end
end
