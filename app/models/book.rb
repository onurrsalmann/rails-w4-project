class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true

  has_many :comments
  has_one :tradeable
  belongs_to :user
  delegate :username, to: :user
end
