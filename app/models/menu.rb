class Menu < ActiveRecord::Base
  validates :name, presence: true

  has_many :menuitems

  def self.active
    all.where("active_menu = ?", true).first
  end
end
