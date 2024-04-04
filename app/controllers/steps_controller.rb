class StepsController < ApplicationController
  before_action :set_recipe
  before_action :set_step, only: %i[ show edit update destroy ]

  def index
    @steps = @recipe.steps
  end

  def show
  end

  def new
    @step = @recipe.steps.build
  end

  def edit
  end

  def create
    @step = @recipe.steps.create! step_params
    
    redirect_to recipe_url(@recipe), notice: "Step was successfully created."
  end

  def update
    @step.update! step_params

    redirect_to recipe_url(@recipe), notice: "Step was successfully updated."
  end

  def destroy
    @step.destroy!

    redirect_to recipe_url(@recipe), notice: "Step was successfully destroyed."
  end

  private

    def set_recipe
      @recipe= Recipe.find(params[:recipe_id])
    end

    def set_step
      @step = @recipe.steps.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:description , :recipe_id)
    end
end
