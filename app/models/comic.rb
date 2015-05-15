class Comic < ActiveRecord::Base
	has_many :ownerships
	has_many :users, :through => :ownerships
	accepts_nested_attributes_for :ownerships
	has_many :loans
	belongs_to :company

	validates :series, presence: true
	validates :year, length: { maximum: 4 }

	def self.identify(search_series, search_creators)
		secret_key = ENV['comicvine_key']
		url = "http://api.comicvine.com/search/?api_key=#{secret_key}&resources=issue&resource_type=issue&format=jsonp&json_callback=handleCallback&offset=0&query=" + series + creators

		comic_vine_response = HTTParty.get(url)
		comic_vine_comics = comic_vine_response["results"]

		return comic_vine_response
	end


end
