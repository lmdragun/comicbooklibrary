class Comic < ActiveRecord::Base
	has_many :user_comics
	has_many :users, :through => :user_comics
	has_many :loans
	belongs_to :company

	validates :series, presence: true
	validates :year, length: { maximum: 4 }

	def self.identify
		secret_key = ENV['comicvine_key']
		@search_series = params[:series].to_s
		@search_creators = params[:creators].to_s
		@url = "http://api.comicvine.com/search/?api_key=#{secret_key}&resources=issue&resource_type=issue&format=jsonp&json_callback=handleCallback&offset=0&query=" + @search_series + @search_creators

		response = HTTParty.get(@url).parsed_response["results"]

		return response
	end

end
