class User < ApplicationRecord
  has_secure_password
  has_many :prompts, dependent: :destroy  
  has_many :fills, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end
