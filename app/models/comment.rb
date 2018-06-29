class Comment < ApplicationRecord
  belongs_to :post
  validates :author_name, presence: true
  validates :body, presence: true, length: { maximum: 100 }

def self.author_name
  Comment.author_name
end

end
