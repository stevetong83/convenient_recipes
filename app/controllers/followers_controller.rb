class FollowersController < ApplicationController

      def create
      @follower = current_user.follows.new
      @follower.follows_id = params[:follow_id]
      @follower.accepted = true if params[:approval_required] == false
      if @follower.save
        redirect_to :back
        flash[:notice] = "You are now following someone"
      else
        redirect_to :back, error: "There was an error"
      end
    end

    def destroy
      @followed_user = User.find params[:follows_id]
      @followed = Follow.where(user_id: params[:user_id]).where(follows_id: params[:follows_id]).first
      @followed.destroy
      redirect_to :back
      flash[:notice] =  "You are now unfollowing someone"
    end

end
