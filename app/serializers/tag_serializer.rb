class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :prompts, :fills
end
