class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, :class_name => "User"
end
