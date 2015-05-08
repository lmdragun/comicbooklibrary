class Friendships < ApplicationController
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Successfully added friend."
			redirect_to root_url
		else
			flash[:error] = "Friend could not be added."
			render :action => 'new'
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Sucessfully removed friend."
		redirect_to current_user
	end
end
