class OwnershipsController < ApplicationController

	def index
		# Returns the comics of a specified user
		@ownerships = current_user.ownerships

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @ownerships }
		end
	end

end
