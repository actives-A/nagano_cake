class Genre < ApplicationRecord
  has_many :items
  validates :genre_name, uniqueness: true,presence: true
end
