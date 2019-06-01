class TagsController < ApplicationController
	def create
		if params[:company_id]
			@company = Company.friendly.find(params[:company_id])
			@new_tag = Tag.new(tag_params)
			@new_tag.company_id = @company.id
			
			if @new_tag.save
				redirect_to @company
			else
				render 'companies/show'
			end	
		else
			@user = User.friendly.find(params[:user_id])
			@new_tag = Tag.new(tag_params)
			@new_tag.user_id = @user.id
			
			if @new_tag.save
				redirect_to @user
			else
				render 'users/show'
			end
		end
	end

	def destroy
		if params[:company_id]
			@company = Company.friendly.find(params[:company_id])
			@destroy_tag = @company.tags.find_by(id: params[:id])
			
			if @destroy_tag == nil
				flash.now.alert = "An error occured while deleting the tag"
				render 'companies/show'
			else
				@destroy_tag.destroy
				redirect_to @company
			end
		else
			@user = User.friendly.find(params[:user_id])
			@destroy_tag = @user.tags.find_by(id: params[:id])
			if @destroy_tag == nil
				flash.now.alert = "An error occured while deleting the tag"
				render '/users/show'
			else
				@destroy_tag.destroy
				redirect_to @user
			end
		end
	end
	private 
	def tag_params
		params.require(:tag).permit(:body)
	end
end
