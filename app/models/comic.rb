class Comic < ActiveRecord::Base
	has_many :libraries
	has_many :users, :through => :libraries
	belongs_to :company

	def self.identify(query)

		@response = HTTParty.get("http://api.comicvine.com/search/?api_key=fa1740b9d89541eaca9c6cbe38c2bf0b1d599c09&limit=6&format=jsonp&json_callback=handleCallback&limit=20&offset=0&query=guardians")

	end
	
end
