class ContactsController < ApplicationController
  def create
		@company = Company.friendly.find(params[:company_id])
		if params[:company][:option] == "company"
			@contact_company = Company.find_by(name: params[:company][:company_name])
			if @contact_company == nil
				flash.now.alert = "Company does not exist!"
				render 'companies/show'
			else
				@new_contact = CompanyContact.new(contact_owner_id: @company.id,
																				company_id: @contact_company.id,
																				name: @contact_company.name,
																				website: params[:company][:website])
				if @new_contact.save
					redirect_to Company.friendly.find(params[:company_id])
				else
					render 'companies/show'
				end
			end
		else
			@contact_user = User.find_by(email: params[:company][:email])
			if @contact_user == nil
				flash.now.alert = "User does not exist!"
				render 'companies/show'
			else
				@new_contact = UserContact.new(company_id: @company.id,
																		 user_id: @contact_user.id,
																		 email: @contact_user.email,
																		 name: params[:company][:username])
				if @new_contact.save
					redirect_to Company.friendly.find(params[:company_id])
				else
					render 'companies/show'
				end
			end
		end
  end

  def destroy
		@contact_owner = Company.friendly.find(params[:company_id])
		if params[:type] == "company"
			@delete_contact = CompanyContact.where("id = ?", params[:id])
			@delete_contact.destroy_all
			redirect_to @contact_owner
		else
			@delete_contact = UserContact.where("id = ?", params[:id])
			@delete_contact.destroy_all
			redirect_to @contact_owner
  	end
	end
end
