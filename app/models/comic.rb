class Comic < ActiveRecord::Base
	has_many :libraries
	has_many :users, :through => :libraries
	belongs_to :company
end
