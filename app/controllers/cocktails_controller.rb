# frozen_string_literal: true

require 'open-uri'

# CocktailsController
class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show]
  before_action :set_all_cocktails, only: %i[home index all]
  before_action :set_default_photo, only: %i[create]

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

    unless @cocktail.photo.attached?
      @cocktail.photo.attach(io: @default, filename: 'default.jpg', content_type: 'image/jpeg')
    end

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_all_cocktails
    @cocktails = Cocktail.all
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_default_photo
    @default = URI.open('https://res.cloudinary.com/bruncky/image/upload/v1582473126/The%20Drunken%20Bard/default.jpg')
  end
end
