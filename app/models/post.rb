class Post < ApplicationRecord

  belongs_to :category
  has_many :comments
  validates :title, presence: true, length: {maximum: 140}
  validates :body, :category_id, presence: true

  mount_uploader :image, ImageUploader
end
