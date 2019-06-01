class WorkersController < ApplicationController
	def create
		@company = Company.friendly.find(params[:company_id])
		@new_member = User.find_by(email: params[:company][:email])

		if @new_member == nil 
			flash.now.alert = "User or Company could not be found !"
			render 'companies/show'
		else
			@new_worker = Worker.create(user_id: @new_member.id, company_id: @company.id)
			if @new_worker.save
				redirect_to @company
			else
				render 'companies/show'
			end
		end
	end	

	def destroy
		@company = Company.friendly.find(params[:company_id])
		@destroy_worker = Worker.find(params[:id])
		if @destroy_worker == nil
			flash.now.alert = "An error occured whilst deleting the company"
			render 'companies/show'
		else
			@destroy_worker.destroy
			redirect_to @company
		end
	end
end
