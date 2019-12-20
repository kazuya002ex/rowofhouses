class User < ApplicationRecord
  has_secure_password
  # has_many :todos, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :password, presence: true
end
