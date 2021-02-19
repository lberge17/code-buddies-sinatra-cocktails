class Ingredient < ActiveRecord::Base
    has_many :measurements
    has_many :cocktails, through: :measurements
end