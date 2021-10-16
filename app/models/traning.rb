class Traning < ApplicationRecord

  validates :theme_text, presence: true

  # belongs_to  :user
  # belongs_to  :post
  has_one_attached :image
  has_many :posts
end
