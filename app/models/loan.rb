class Loan < ActiveRecord::Base
	has_one :lender, :class_name => "User"
	# indentation!
  has_one :lendee, :class_name => "User"
	belongs_to :ownership
end
