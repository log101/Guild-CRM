class InvitationsController < ApplicationController
	def create
		@company = Company.find(params[:company_id])
		@invited_user = User.find_by(email: params[:company][:email])
		if @invited_user == nil
			flash.now.alert = "User could not be found"
			render 'companies/show'
		else
			@invitation = Invitation.new(sender_id: @company.owner_id, 
																	 invited_id: @invited_user.id,
																	 company_id: @company.id)
			if @invitation.save
				redirect_to @company
			else
				render 'companies/show'
			end
		end
	end

	def accept
		@company = Company.friendly.find(params[:company_id])
		@user = User.friendly.find(params[:user_id])
		@new_worker = Worker.create(user_id: @user.id, company_id: @company.id)
		if @new_worker.save
			Invitation.where("invited_id = ? AND company_id = ?", @user.id, @company.id).destroy_all
			redirect_to @company
		else
			render 'companies/show'
		end	
	end

	def reject
		@company = Company.friendly.find(params[:company_id])
		@user = User.friendly.find(params[:user_id])
		Invitation.where("invited_id = ? AND company_id = ?", @user.id, @company.id).destroy_all
			redirect_to @user
	end
	def email_param
		params.require(:company).permit(:email)
	end
end
