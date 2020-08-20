class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :body
  
  # belongs_to :post
end
