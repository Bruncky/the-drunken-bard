# frozen_string_literal: true

# Dose Model
class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true

  validate_uniqueness_of :dose_id, scope: %i[ingredient_id cocktail_id]
end
