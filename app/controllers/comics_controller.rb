class ComicsController < ApplicationController

	def index
		@comics = Comic.all
		@comic = Comic.new

	end

	def lookup
		@result = Comic.identify
		respond_to do |format|
		format.html {render :index}
		format.json {render json: @result.parsed_response}
	end
	end

	def show
		@comic = Comic.find(params[:id])
	end

	def new
			@companies = Company.all
			@user = current_user
			@libraries = @user.libraries.all
			@foundComic = Comic.find(params[:id])
			@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		if @comic.save
			redirect_to @comic
		else
			render :new
		end
	end

	private

	def comic_params
	params.require(:comic).permit(:title, :number, :creators, :date_published, :year, :series, :company_id, :cover_img_url)
end

end
