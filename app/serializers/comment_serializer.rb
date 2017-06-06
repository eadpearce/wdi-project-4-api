class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :date_created, :created_at
  has_one :fill
  has_one :prompt
  belongs_to :user
end
