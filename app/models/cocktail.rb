class Cocktail < ActiveRecord::Base
    belongs_to :user
    has_many :measurements
    has_many :ingredients, through: :measurements
end