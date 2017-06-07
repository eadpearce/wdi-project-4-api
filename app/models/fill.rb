class Fill < ApplicationRecord
  belongs_to :prompt, optional: true
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true
  attr_accessor :tagged_as

  def date_created
    require 'date'
    date = self.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
