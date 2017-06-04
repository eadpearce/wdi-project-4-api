class PromptSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :date_created, :created_at, :filled, :unfilled
  has_one :user
  has_many :tags
  has_many :fills

  def date_created
    require 'date'
    date = object.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end

  def filled
    if object.fills.length != 0
      filled = true
    else filled = false
    end
    filled
  end
  def unfilled
    if object.fills.length != 0
      unfilled = false
    else unfilled = true
    end
    unfilled
  end
end
