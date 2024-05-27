class IngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient, only: %i[ show edit update destroy ]

  def index
    @ingredients = @recipe.ingredients
  end

  def show
  end

  def new
    @ingredient = @recipe.ingredients.build
  end

  def edit
  end

  def create
    @ingredient = @recipe.ingredients.create! ingredient_params

    redirect_to recipe_url(@recipe), notice: "Ingredient was successfully created."
  end

  def update

    @ingredient.update! ingredient_params

    redirect_to recipe_url(@recipe), notice: "Ingredient was successfully updated."
  end

  def destroy
    @ingredient.destroy!

    redirect_to recipe_url(@recipe), notice: "Ingredient was successfully destroyed."
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :unit, :recipe_id)
    end
end
