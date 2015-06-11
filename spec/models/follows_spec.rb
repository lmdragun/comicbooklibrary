require 'rails_helper'

describe "Following" do
	before(:each) do
		@user1 = User.create!(username: "user1", email: "user1@example.com", password: "qwertyuiop")
		@user2 = User.create!(username: "user2", email: "user2@example.com", password: "qwertyuiop")
	end

	it "should allow two users to following each other" do
		result = @user1.follow(@user2)
		expect(result).to be(true)
		expect(@user1.followed).to include(@user2)
	end

	it "should not allow a user to follow someone they already follow" do
		@user1.follow(@user2)
		result = @user1.follow(@user2)
		expect(result).to be(false)
		expect(@user1.followed).to include(@user2)
		expect(@user1.followed.size).to eq(1)
	end

end
