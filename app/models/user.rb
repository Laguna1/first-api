class User < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy

  validates :name, presence: true
end
