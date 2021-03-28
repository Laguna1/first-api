class Book < ApplicationRecord
  belongs_to :tracker
  belongs_to :user, through: :tracker
  
  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true
  validates :read, presence: true
end
