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

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @comics }
		end
	end

	def lookup
		@result = Comic.identify(
			# taking out spaces, replacing with dashes
			params[:series].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-'),
			params[:creators].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		)

		respond_to do |format|
			format.html {render :index}
			format.json {render json: @result}
		end
	end

	def show
		@comic = Comic.find(params[:id])
	end

	def new
			@companies = Company.all
			@comic = Comic.new
			@ownership = current_user.ownerships.new
	end

	def create
		@company = params[:post][:id]
		@comic = Comic.new(comic_params, company_id: @company)
		@ownership = current_user.ownerships.new(ownership_params, comic:@comic)
		if @ownership.save
			redirect_to @comic
		else
			render :new
		end
	end

	def edit

	end

	def update
		@comic.update(comic_params)
		redirect_to @comic
	end



	private

	def comic_params
		params.require(:comic).permit(:title, :number, :creators, :date_published, :year, :series, :company_id, :cover_img_url)
	end

	def ownership_params
		params.required(:ownership).permit(:location, :favorite, :note)
	end

end
