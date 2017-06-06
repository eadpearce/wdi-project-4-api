class FillSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :date_created, :created_at, :tags
  has_one :prompt
  belongs_to :user
  has_many :comments

  # def user
  #   UserSerializer.new(Fill.user)
  # end

  # def date_created
  #   require 'date'
  #   date = object.created_at
  #   formatted_date = date.strftime('%c')
  #   formatted_date
  # end
end
