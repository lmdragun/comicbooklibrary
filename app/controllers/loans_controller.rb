class LoansController < ApplicationController

	def index

	end

	def new
		@users = User.all
		@comic = Comic.find(params[:comic_id])
		@lender = current_user
		@loan = Loan.new
	end

	def create
		@comic = Comic.find(params[:comic_id])
		@lender = current_user
		@loan = Loan.new(lender_id: @lender.id, lendee_id: params[:lendee], comic_id: @comic.id, out: true)
		if @loan.save
			redirect_to @lender
		else
			render :new
		end
	end

	private

	def loan_params
		# params.require(:loan).permit()
	end

end
