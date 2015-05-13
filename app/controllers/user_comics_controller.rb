class UserComicsController < ApplicationController

	def index
		# Returns the comics of a specified user
		@user_comics = current_user.user_comics

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @user_comics }
		end
	end

end
