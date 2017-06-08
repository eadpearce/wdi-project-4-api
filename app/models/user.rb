class User < ApplicationRecord
  has_secure_password
  has_many :prompts
  has_many :fills
  has_many :comments
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end
