require 'spec helper'
require '../app/controllers/users_controller'

describe "User" do

	  it "can be instantiated" do
	    user = User.new(email: "test@test.com", username: "test", password: "testtest")
	    expect(user.class).to be(User)
	  end


		it "can be destroyed" do
			user = User.last
			user.destroy
			expect(User.last).not_to be(user)
		end

end
