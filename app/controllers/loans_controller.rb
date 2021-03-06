class LoansController < ApplicationController

	def index
		@ownership = Ownership.find(params[:ownership_id])
		@loans = @ownership.loans.all
	end

	def new
		@users = User.all
		@comic = Comic.find(params[:comic_id])
		@lender = current_user
		@loan = Loan.new
	end

	def create
		@comic = Comic.find(params[:comic_id])
		@ownership = current_user.ownerships.find(params[:comic_id])
		@loan = Loan.new(lender_id: current_user.id, lendee_id: params[:post][:id], ownership_id: @ownership.id, out: true)
		if @loan.save
			redirect_to current_user
			flash[:notice] = "Added loan"
		else
			render :new
			flash[:error] = "Unable to add loan"
		end
	end

	def edit
		@loan = Loan.find(params[:id])
		@loan.update(out: params[:out])
	end

	def update
			@loan = Loan.find(params[:id])
			@loan.update(out: params[:out])
			redirect_to current_user
			flash[:notice] = "Updated Loan"
	end


	private

	def loan_params
		# params.require(:loan).permit()
	end

end
