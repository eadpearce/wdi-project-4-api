class User < ApplicationRecord
  has_secure_password
  has_many :prompts
  has_many :fills
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  def to_param
    username
  end
end
