class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @recipe = Recipe.find params[:recipe]
    @favorite_recipe = current_user.favorite_recipe! @recipe
    if @favorite_recipe
      redirect_to :back, notice: "Recipes has been added to your favorites"
    else
      redirect_to :back
      flash[:error] = "This is already a favorite recipe"
    end
  end

  def destroy
    @recipe = Recipe.find params[:recipe]
    @favorite_recipe = Favorite.where(recipe: @recipe).where(user: current_user).first
    @favorite_recipe.destroy
    redirect_to :back, notice: "Recipe has been removed from your favorites"
  end

end
