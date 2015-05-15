class ComicsController < ApplicationController

	def index
		@comics = Comic.all
		@comic = Comic.new
		@series_test = "Test Gambit Rogue"
		@series = @series_test.gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		@creators_test = "Test Whedon"
		@creators = @creators_test.gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		# @series = params[:series].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		# @creators = params[:creators].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		secret_key = ENV['comicvine_key']
		url = "http://api.comicvine.com/search/?api_key=#{secret_key}&resources=issue&resource_type=issue&format=jsonp&json_callback=handleCallback&offset=0&query=" + @series + @creators

		comic_vine_response = HTTParty.get(url)
		comic_vine_comics = comic_vine_response["results"]

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @comics }
		end
	end

	def lookup
		@result = Comic.identify(
			# taking out spaces, replacing with dashes
			@series = params[:series].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-'),
			@creators = params[:creators].gsub(/[.\/,&()]/, '').gsub(/[\s\-]+/, '-')
		)
		respond_to do |format|
			format.html {render :index}
			format.json {render json: @result}
		end
	end

	def show
		@comic = Comic.find(params[:id])
		@date = @comic.date_published
	end

	def new
			@companies = Company.all
			@comic = Comic.new
			@ownership = current_user.ownerships.new
	end

	def create
		company_id = params[:post][:id]
		# comics params reject ownership, from the strong params below
		@comic = Comic.new(comic_params.merge(company_id: company_id).reject {|key| key == 'ownership' })
		@ownership = current_user.ownerships.new(comic_params[:ownership].merge(comic:@comic))
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
		# this parses any string date into a proper looking date regardless of what was put in
		# params[:comic][:date_published] = Chronic.parse(params[:comic][:date_published]).to_date
		# these are strong params, since ownership was included in the same form, it ends up in comic params
		params.require(:comic).permit(:title, :number, :creators, :date_published, :year, :series, :company_id, :cover_img_url, :ownership => [:location, :favorite, :note])
	end

end
