class User < ApplicationRecord
  has_secure_password

  has_many :posts
  validates :email, uniqueness: true
  validates :user_name, uniqueness: true
end
