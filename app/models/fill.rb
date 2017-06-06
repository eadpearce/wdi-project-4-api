class Fill < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  def date_created
    require 'date'
    date = self.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
