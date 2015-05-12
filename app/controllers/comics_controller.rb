class ComicsController < ApplicationController

	def index
		@comics = Comic.all
		@comic = Comic.new
		# secret_key = ENV['comicvine_key']
		# @search_series = params[:series].to_s
		# @search_creators = params[:creators].to_s
		# @url = "http://api.comicvine.com/search/?api_key=#{secret_key}&resources=issue&resource_type=issue&format=jsonp&json_callback=handleCallback&offset=0&query=" + @search_series + @search_creators
		#
		# @response = HTTParty.get(@url).parsed_response["results"]
		# p @response
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
			@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		@usercomic = current_user.user_comics.new(comic:@comic)
		if @usercomic.save
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
