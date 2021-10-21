class Post < ApplicationRecord

  validates :title, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :traning

  def self.search(search)
    if search != ""
      Post.joins(:user).where(['users.nickname LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Post.includes(:user).order("updated_at DESC")
    end
  end
end
