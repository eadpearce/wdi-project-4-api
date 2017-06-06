class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :about
  has_many :fills
  has_many :prompts
  has_many :comments
end
