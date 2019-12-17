class User < ApplicationRecord
  has_secure_password
  # has_many :todos, dependent: :destroy
  validates :name, presence: true
  validates :password, presence: true
end
