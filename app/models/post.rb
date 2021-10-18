class Post < ApplicationRecord

  validates :title, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :traning
end
