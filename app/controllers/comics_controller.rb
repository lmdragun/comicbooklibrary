class ComicsController < ApplicationController

	def index
		@comics = Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
	end

	def new
		@response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=dachshund&api_key=dc6zaTOxFJmzC&limit=116").parsed_response["data"][@random]["images"]["original"]["url"]
			@comic = Comic.new
			respond_to do |format|
				format.html { render :show }
				format.json { render json: @comics }
			end
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
	params.require(:comic).permit(:title, :number, :creators, :date_published, :year, :series, :company_id)
end

end
