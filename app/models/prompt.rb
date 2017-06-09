class Prompt < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, uniq: true
  has_many :comments, dependent: :destroy  
  has_many :fills
  attr_accessor :tagged_as
  attr_accessor :anon
  validates :title, presence: true
  validates :body, presence: true
end
