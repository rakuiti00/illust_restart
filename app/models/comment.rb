class Comment < ApplicationRecord

  validates :text, presence: true
  validates :good_point, presence: true

  belongs_to :user
  belongs_to :post
end
