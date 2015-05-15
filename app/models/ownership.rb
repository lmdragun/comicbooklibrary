class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :comic
  has_many :loans
end
