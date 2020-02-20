# frozen_string_literal: true

# CocktailsController
class CocktailsController < ApplicationController
  before_action :set_task, only: %i[show]

  def index
    @cocktails = Cocktail.all
  end

  def show; end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_task
    @cocktail = Cocktail.find(params[:id])
  end
end
