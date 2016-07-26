class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email, :message => 'does not look like a valid e-mail address'
  validates :state, length: { is: 2 }
  validates :zip_code, length: { is: 5 }
end
