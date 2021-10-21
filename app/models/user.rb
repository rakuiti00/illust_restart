class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字と数字を混合してください" }

  URL_REGEX = /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  with_options format: { with: URL_REGEX, message: '正しいURLを入力してください' } do
    validates :twitter_url
    validates :pixiv_url
    validates :another_url
  end

  
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :coments
  has_many :tranings
  has_one_attached :image, dependent: :destroy
  
end
