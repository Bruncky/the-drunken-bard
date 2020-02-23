# frozen_string_literal: true

# CocktailsController
class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show]
  before_action :set_all_cocktails, only: %i[home index all]

  def home; end

  def index; end

  def all; end

  def show
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_all_cocktails
    @cocktails = Cocktail.all
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
