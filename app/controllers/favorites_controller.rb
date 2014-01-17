class FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find params[:id]
    current_user.favorite_recipe!
  end

end
