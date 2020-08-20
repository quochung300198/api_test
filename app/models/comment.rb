class Comment < ApplicationRecord
  belongs_to :posts

  validates :name, :body, presence: true
end
