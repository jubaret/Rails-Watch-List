class List < ApplicationRecord
  has_many :reviews
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, length: { minimum: 1 }
  validates :name, uniqueness: true
  has_one_attached :photo
end
