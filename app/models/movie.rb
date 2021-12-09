class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :overview, length: { minimum: 1 }
end
