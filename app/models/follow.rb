class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, :class_name => "User"

  validates :followed,
    presence: true,
    uniqueness: true

end
