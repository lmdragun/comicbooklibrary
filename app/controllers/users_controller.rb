class UsersController < ApplicationController
before_action :require_signin, except: [:new, :create]

def index
	@users = User.all

	respond_to do |format|
		format.html { render :index }
		format.json { render json: @users }
	end

end

def show
	@user = User.find(params[:id])
	@comics_sorted = @user.comics.sort_by { |comic| comic.series.capitalize }
end

def new
		@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		sign_in @user
		redirect_to @user
	else
		render :new
	end
end

def edit
end

def update
end

# for future Admin privileges
def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to root_url

end

private
	def user_params
		params.require(:user).permit(
			:username,
			:email,
			:password,
			:password_confirmation
			)
	end

end
