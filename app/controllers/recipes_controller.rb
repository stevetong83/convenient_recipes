class RecipesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  layout 'user', only: [:my_recipes, :favorite_recipes, :new]

  def index
    @recipes = Recipe.all
  end

  def my_recipes
    @recipes = current_user.recipes.all
  end

  def favorite_recipes
    @recipes = current_user.favorite_recipes.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create recipe_params
    if @recipe.save
      redirect_to @recipe, notice: "Recipe created successfully."
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find params[:id]
    @reviews = @recipe.reviews.all
    @review = Review.new
    @ingredients = @recipe.split_ingredients
    @grocery_list_ingredients = GroceryListIngredient.new
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]
    @recipe.update_attributes recipe_params
    if @recipe.save
      redirect_to @recipe, notice: "Recipe has been updated"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe has been deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :credits)
  end
end
