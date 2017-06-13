class Fill < ApplicationRecord
  belongs_to :prompt, optional: true
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags, uniq: true
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  attr_accessor :tagged_as
  attr_accessor :anon

  def date_created
    require 'date'
    date = self.created_at
    formatted_date = date.strftime('%c')
    formatted_date
  end
end
