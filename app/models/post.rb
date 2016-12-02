class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum: 170 }
end
