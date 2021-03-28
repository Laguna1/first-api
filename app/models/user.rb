class User < ApplicationRecord
  has_secure_password

  has_many :trackers
  has_many :books, through: :trackers, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
