class FollowsController < ApplicationController
  def create
    @follow = current_user.follows.build(:followed_id => params[:followed_id])
    if @follow.save
      flash[:notice] = "Followed user."
      redirect_to current_user
    else
      flash[:error] = "Unable to follow user."
      redirect_to root_url
    end
  end

  def destroy
    @follow = current_user.follows.find(params[:id])
    @follow.destroy
    flash[:notice] = "Stopped following user."
    redirect_to current_user
  end
end
