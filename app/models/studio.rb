class Studio < ApplicationRecord
  belongs_to :movie
  has_many :movies
end