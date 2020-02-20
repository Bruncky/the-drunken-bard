# frozen_string_literal: true

require 'open-uri'
require 'json'

def ingredient_query
  JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
end

ingredient_query['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
