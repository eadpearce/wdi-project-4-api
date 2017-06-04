class FillSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :date_created, :created_at
  has_one :prompt
  has_one :user

  def date_created
    require 'date'
    date = object.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
