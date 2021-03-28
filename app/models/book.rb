class Book < ApplicationRecord
  has_one :tracker, dependent: :destroy
  has_one :user, through: :tracker

  validates :title, presence: true, length: { minimum: 3 }
  validates :author, presence: true
  validates :pages, presence: true
  validates :read, presence: true
end
