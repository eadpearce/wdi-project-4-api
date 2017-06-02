class FillSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :prompt
  has_one :user
end
