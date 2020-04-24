class Menu < ActiveRecord::Base
  has_many :menuitems

  #def self.of_menu(menu)
  # all.where(menu_id: menu.id)
  #end
end
