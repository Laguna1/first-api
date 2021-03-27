class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true
  validates :read, presence: true
end
