class UserComic < ActiveRecord::Base
  belongs_to :user
  belongs_to :comic
end
