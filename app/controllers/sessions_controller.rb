class SessionsController < ApplicationController
	def new
		#For error handling
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id.to_s
			redirect_to @user
		else
			flash.now.alert = "Login Failed!"			
			render :new 
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end
