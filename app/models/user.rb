class User < ApplicationRecord
  has_secure_password
  has_many :courses, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }
end
