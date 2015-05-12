class Loan < ActiveRecord::Base
	belongs_to :lender, :class_name => "User"
  belongs_to :lendee, :class_name => "User"
end
