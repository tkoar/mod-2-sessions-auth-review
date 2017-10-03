class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :programs
  has_secure_password
end
