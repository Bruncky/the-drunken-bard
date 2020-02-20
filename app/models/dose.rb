class Dose < ApplicationRecord
  belongs_to :Ingredient
  belongs_to :Cocktail
end
