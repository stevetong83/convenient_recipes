class GroceryListIngredientsController < ApplicationController
  before_filter :authenticate_user!

  layout 'user'

  def index
    @ingredient = GroceryListIngredient.new
    @ingredients = current_user.grocery_list_ingredients.all
  end

  def create
    @ingredient = current_user.grocery_list_ingredients.build ingredient_params
    if @ingredient.save
      redirect_to :back, notice: "Ingredient added successfully"
    else
      redirect_to :back
      flash[:error] = "Unable to add ingredient to grocery list"
    end
  end

  def create_multiple
    @ingredients = params[:ingredients]
    if @ingredients.present?
      @ingredients.each do |ingredient|
        current_user.grocery_list_ingredients.create(name: ingredient)
      end
      redirect_to :back, notice: "Ingredients added to your grocery list"
    else
      redirect_to :back
      flash[:error] = "Please select an ingredient"
    end
  end

  def destroy
    @ingredient = GroceryListIngredient.find params[:id]
    @ingredient.destroy
    redirect_to :back, notice: "Ingredient has been removed from your list"

  end

  private

  def ingredient_params
    params.require(:grocery_list_ingredient).permit(:name)
  end

end
