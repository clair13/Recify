class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def search
    if params[:query].present?
      search_results = Recipe.where('title ILIKE ?', "%#{params[:query]}%")
      @recipes = search_results.any? ? search_results : Recipe.all
      @no_results_fallback = search_results.empty?
    else
      # If no query, show all recipes
      @recipes = Recipe.all
      @no_search_results_fallback = false
    end

    respond_to do |format|
      format.turbo_stream
      format.html { render :index }
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @steps = @recipe.steps
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :preparation_time, :difficulty_level, :portion, :image)
  end
end
