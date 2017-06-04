class PromptSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :date_created, :created_at
  has_one :user
  has_many :tags
  has_many :fills

  def date_created
    require 'date'
    date = object.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
