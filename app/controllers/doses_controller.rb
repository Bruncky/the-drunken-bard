# frozen_string_literal: true

class DosesController < ApplicationController
  before_action :set_cocktail, only: %i[new create]
  before_action :set_dose, only: %i[destroy]

  def index; end

  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
