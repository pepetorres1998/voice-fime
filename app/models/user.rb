class User < ApplicationRecord
  has_secure_password
  has_one :session

  validates :name, :email, presence: true, uniqueness: true
end
