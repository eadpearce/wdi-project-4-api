class FillSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :date_created, :created_at, :tags
  has_one :prompt
  belongs_to :user
  has_many :comments
end
