class LibrariesController < ApplicationController

	def index
		@user = current_user
		@libraries = @user.libraries.all
	end

	def show
		@library = Library.find(params[:id])
	end

	def new
			@library = Library.new
	end

	def create
		@library = Library.new(library_params.merge(user:current_user))
		if @library.save
			redirect_to @library
		else
			render :new
		end
	end

	private

	def library_params
		params.require(:library).permit(:name, :note)
	end
end
