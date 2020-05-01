class Menu < ActiveRecord::Base
  has_many :menuitems

  def self.active
    all.where("active_menu = ?", true)
  end
end
