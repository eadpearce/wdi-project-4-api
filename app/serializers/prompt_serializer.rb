class PromptSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :date_created, :created_at, :filled, :unfilled, :tags, :rating
  has_one :user
  # has_many :tags # returns all the nested shit as well
  has_many :fills
  has_many :comments

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
