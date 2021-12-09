class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, length: { minimum: 1 }
  validates :name, uniqueness: true
end
