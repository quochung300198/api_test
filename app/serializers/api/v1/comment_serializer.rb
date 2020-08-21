class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :body
  
  # belongs_to :post
end
