class UsersController < ApplicationController
	def new
		#For error handling
		@new_user = User.new
		@user = User.new
	end

	def show
		@new_tag = Tag.new
		@user = User.friendly.find(params[:id])
		@companies = Company.where("owner_id = ?", @user.id)
		@member_companies = Worker.where("user_id = ?", @user.id)
		@invitations = Invitation.where("invited_id = ?", @user.id)
	end

	def create
		@new_user = User.new(user_params)
			if @new_user.save
				session[:user_id] = @new_user.id.to_s
				redirect_to @new_user
			else
				render 'new'
			end
	end

	def destroy
		@destroy_user = User.friendly.find(params[:id])
		if @destroy_user.destroy
			session[:user_id] = nil
			redirect_to "/"
		else
			render 'show'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
