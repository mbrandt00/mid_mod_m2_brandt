class Movie < ApplicationRecord
  belongs_to :studio
  has_many :roles
  has_many :actors, through: :roles
  
  def average_age_of_actors
    actors.average(:age).round(2)
  end
end