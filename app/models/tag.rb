class Tag < ApplicationRecord
  has_and_belongs_to_many :prompts
  has_and_belongs_to_many :fills
  validates :name, presence: true
end
