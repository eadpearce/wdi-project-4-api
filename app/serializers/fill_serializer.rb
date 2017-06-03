class FillSerializer < ActiveModel::Serializer
  attributes :id, :body, :title
  has_one :prompt
  has_one :user
end
