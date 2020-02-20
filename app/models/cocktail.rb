# frozen_string_literal: true

# Cocktail Model
class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients

  validates :name, presence: true, uniqueness: true
end
