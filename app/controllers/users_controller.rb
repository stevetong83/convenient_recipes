class UsersController < ApplicationController

  layout 'user', only: [:following, :followers, :settings]

  def show
    @user = User.find params[:id]
    @recipes = @user.recipes.all
  end

  def following

  end

  def followers

  end

  def settings

  end
    
end
