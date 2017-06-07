class Prompt < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :fills
  attr_accessor :tagged_as
  validates :title, presence: true
  validates :body, presence: true
end
