class Loan < ActiveRecord::Base
	has_one :lender
  has_one :lendee
	belongs_to :ownership
end
