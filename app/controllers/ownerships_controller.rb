class OwnershipsController < ApplicationController

	def index
		# Returns the comics of a specified user
		@ownerships = current_user.ownerships

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @ownerships }
		end
	end

# currently found in the comics controller
	def new
	end
	def create
	end

	def edit
		@ownership = current_user.ownerships.find(params[:id])
	end

	def update
		@ownership = current_user.ownerships.find( params[:id] )
		if @ownership.update( ownership_params )
			redirect_to @current_user
		else
			render :edit
		end
	end

	def destroy
		@ownership = current_user.ownerships.find( params[:id] )
		@ownership.destroy
		redirect_to current_user
		flash[:notice] = "Comic removed from your collection."
	end

	private
	  def ownership_params
	    params.require(:ownership).permit(
			:note,
			:location,
			:favorite
			)
		end
end
