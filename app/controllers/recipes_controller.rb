class RecipesController < ApplicationController
  before_filter :authenticate_user!, except: :show

  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create params[:recipe]
    if @recipe.save
      redirect_to @recipe, notice: "Recipe created successfully."
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe has been deleted."
  end
end
