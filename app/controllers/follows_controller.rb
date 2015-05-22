class FollowsController < ApplicationController
  def create

    # maybe check that the user isn't already following that user?
    @user = User.find(params[:followed_id])
    
    if current_user.follow(@user)
      flash[:notice] = "Followed user."
      redirect_to @user
    else
      flash[:error] = "Unable to follow user."
      redirect_to current_user
    end
  end

  def destroy
    @follow = current_user.follows.find(params[:id])
    @follow.destroy
    flash[:notice] = "Stopped following user."
    redirect_to current_user
  end
end
