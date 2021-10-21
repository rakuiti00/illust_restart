class Traning < ApplicationRecord

  validates :theme_text, presence: true

  has_one_attached :image, dependent: :destroy
  has_many :posts
end
