class SessionsController < ApplicationController

	def new
	end

	def create
		#Find the user by email
		user = User.find_by(email: params[:session][:email].downcase)
			#hash of session will contain the email

			#Testing if user was found AND authenticated
			if user && user.authenticate(params[:session][:password])
				sign_in(user)
				redirect_to current_user
			else
				flash[:error] = "Invalid email/password"
				redirect_to new_session_path
			end

	end

	def destroy
	  sign_out
	  redirect_to root_url
	end


end
