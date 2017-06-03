class PromptSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :user
  has_many :tags
end
