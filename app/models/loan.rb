class Loan < ActiveRecord::Base
	belongs_to :friend
	belongs_to :library
end
