class User < ActiveRecord::Base
		has_many :comics, :through => :libraries
		has_many :libraries
		has_many :friendships
		has_many :friends, :through => :friendships
		has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
		has_many :inverse_friends, :through => :inverse_friendships, :source => :user


		before_create :create_remember_token
		before_save :normalize_fields

		validates :username,
			presence: true,
			length: { maximum: 40 }

		validates :email,
			presence: true,
			uniqueness: { case_sensitive: false },
			format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #checks for basic email structure

		validates :password,
			length: { minimum: 8 }

		has_secure_password #calls method, expects password and password confirmation

	#Create a new remember token for a user
	def User.new_remember_token
		begin
			self[column] = SecureRandom.urlsafe_base64 #giving access to bcrypt
		end while User.exists?(column => self[column])
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