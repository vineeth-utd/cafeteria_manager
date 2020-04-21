class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true

  has_secure_password

  has_many :orders

  def get_customer
    all.where(role: "Customer")
  end

  def get_billing_clerk
    all.where(role: "Billing-Clerk")
  end
end
