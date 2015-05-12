class Comic < ActiveRecord::Base
	has_many :libraries
	has_many :usercomics
	has_many :users, :through => :libraries
	belongs_to :company

	def self.identify
		secret_key = ENV['comicvine_key']

		response = HTTParty.get("http://api.comicvine.com/search/?api_key=#{secret_key}&limit=6&format=jsonp&json_callback=handleCallback&limit=20&offset=0&query=guardians")

		return response
	end

end
