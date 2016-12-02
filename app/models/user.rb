class User < ApplicationRecord
  has_secure_password

  has_many :posts
  validates :email, uniqueness: true
  validates :user_name, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :full_name, presence: true
  validates :user_name, presence: true
end
