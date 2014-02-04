class PagesController < ApplicationController

  def index
    @users =  User.all
    if current_user
      @recipes = current_user.recipes.all
      @following = current_user.followed_users.all
      @followers = current_user.followers
    end
  end
    
end
