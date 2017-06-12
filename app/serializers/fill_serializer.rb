class FillSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :date_created, :created_at, :tags, :rating
  has_one :prompt
  belongs_to :user
  has_many :comments
end
