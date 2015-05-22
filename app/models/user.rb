class User < ActiveRecord::Base
		has_many :comics, through: :ownerships
		has_many :ownerships
		has_many :lendees
		has_many :lenders
		has_many :loans, :through => :lenders
		has_many :loans, :through => :lendees
		has_many :follows
		has_many :followed, :through => :follows
		has_many :inverse_follows, :class_name => "Follow", :foreign_key => "followed_id"
		has_many :followers, :through => :inverse_follows, :source => :user

		before_create :create_remember_token
		before_save :normalize_fields

		validates :username,
			presence: true,
			uniqueness: true,
			length: { maximum: 40 }

		validates :email,
			presence: true,
			uniqueness: { case_sensitive: false },
			format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #checks for basic email structure

		validates :password,
			length: { minimum: 8 }

		has_secure_password #calls method, expects password and password confirmation

	#Create a new remember token for a user
	# this is correct, but idiomatic ruby usually uses self to define class methods:
	# def self.new_remember_token
	# ...
	# end
	# as long as you're consistent though, it's cool!
	# also :thumbs_up: for hand-rolled auth!
	def User.new_remember_token
		SecureRandom.urlsafe_base64 #giving access to bcrypt
	end

	#Hashing a token
	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def send_password_reset
		User.new_remember_token(:password_reset)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def follow(other_user)
		if self.followed.include?(other_user)
			return false
		else
			self.follows.create(:followed_id => other_user.id)
			return true
		end
	end

	private
	#Create new session token for the user
	def create_remember_token
		remember_token = User.hash(User.new_remember_token)
	end

	#Normalize fields for consistency:
	def normalize_fields
		self.email.downcase!
	end

end
