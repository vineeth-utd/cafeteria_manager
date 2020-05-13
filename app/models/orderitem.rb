class Orderitem < ActiveRecord::Base
  belongs_to :order
  #belongs_to :menuitem

  def self.get(id)
    find_by(menu_item_id: id)
  end

  def self.get_qty(id)
    find_by(menu_item_id: id).qty
  end
end
