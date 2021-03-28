class Tracker < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user, presence: true
  validates :book, presence: true
end
