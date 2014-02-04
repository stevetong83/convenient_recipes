class RelationshipsController < ApplicationController

  def create
    @user = User.find params[:followed_id]
    @relationship = current_user.follow! @user
    if @relationship
      redirect_to :back
      flash[:notice] = "You are now following #{@user.name}"
    else
      redirect_to :back
      flash[:error] = "You are already following #{@user.name}"
    end
  end

  def destroy
    @user = User.find params[:followed_id]
    @followed = Relationship.where(user_id: current_user.id).where(followed_id: @user.id).first
    @followed.destroy
    redirect_to :back
    flash[:notice] =  "You are now unfollowing #{@user.name}"
  end
end
