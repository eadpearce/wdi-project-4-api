class PromptSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :user
end
