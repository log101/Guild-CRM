class LoginController < ApplicationController
  def index
		if session[:user_id]
			redirect_to User.find(session[:user_id].to_i)
		end
  end
end
