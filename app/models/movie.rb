class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  validates :poster_url, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }
end
