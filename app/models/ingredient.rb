# frozen_string_literal: true

# Ingredient Model
class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true
end
