class Post < ApplicationRecord
  #add validations
  validates :post_title, :post_body, presence: true

  #one and many relationships
  has_one_attached :image
  has_many_attached :uploads
end
