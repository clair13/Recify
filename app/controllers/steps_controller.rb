class StepsController < ApplicationController
  before_action :set_recipe
  before_action :set_step, only: %i[ show edit update destroy ]

  def index
    @steps = @recipe.steps
  end

  def show
  end

  def new
    @step = @recipe.steps.new
  end

  def edit
  end

  def create
    @step = @recipe.steps.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to step_url(@step), notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to recipe_steps_path(@recipe), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy

    respond_to do |format|
      format.html { redirect_to recipe_steps_path(@recipe), notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_recipe
      @recipe= Recipe.find(params[:recipe_id])
    end

    def set_step
      @step = @recipe.steps.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:description)
    end
end
