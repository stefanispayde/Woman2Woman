class Post < ApplicationRecord

  belongs_to :category
  validates :title, presence: true, length: {maximum: 140}
  validates :body, :category_id presence: true
end
