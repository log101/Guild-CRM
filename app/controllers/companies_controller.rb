class CompaniesController < ApplicationController
	def show
		@company = Company.friendly.find(params[:id])
		@workers = Worker.where("company_id = ?", @company.id)
		@company_contacts = CompanyContact.where("contact_owner_id = ?", @company.id)
		@user_contacts = UserContact.where("company_id = ?", @company.id)
	end

	def create
		@user = User.find(session[:user_id].to_i)
		@new_company = Company.new(company_params)
		@new_company.owner_id = session[:user_id]

		if @new_company.save
			redirect_to @new_company
		else
			render 'users/show'
		end
	end

	def destroy
		@destroy_company = Company.friendly.find(params[:id])
		@destroy_company.destroy
		redirect_to User.find(@destroy_company.owner_id)
	end
	private
	def company_params
		params.require(:company).permit(:description, :name)
	end
end
