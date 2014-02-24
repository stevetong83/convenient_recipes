class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?

  before_filter :relationships

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def relationships
    @users =  User.all
    if current_user
      @recipes = current_user.recipes.all
      @following = current_user.followed_users.all
      @followers = current_user.followers
    end
  end

end
