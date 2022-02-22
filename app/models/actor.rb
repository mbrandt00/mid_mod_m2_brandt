class Actor < ApplicationRecord
    has_many :roles 
    has_many :movies, through: :roles

    def self.by_age
        order(age: :asc)
    end
end