# frozen_string_literal: true

# Dose Model
class Dose < ApplicationRecord
  belongs_to :Ingredient
  belongs_to :Cocktail

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true

  validate_uniqueness_of :dose_id, scope: [ :ingredient_id, :cocktail_id ]
end
