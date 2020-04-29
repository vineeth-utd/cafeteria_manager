class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true

  has_secure_password

  has_many :orders

  def is_Manager?
    if role == "Manager"
      true
    else
      false
    end
  end

  def is_Billing_Clerk?
    if role == "Billing-Clerk"
      true
    else
      false
    end
  end
end
