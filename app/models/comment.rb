class Comment < ApplicationRecord
  belongs_to :fill, optional: true
  belongs_to :prompt, optional: true
  belongs_to :user, optional: true
  validates :body, presence: true

  def date_created
    require 'date'
    date = self.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
