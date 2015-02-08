class ResultsController < ApplicationController
	before_action :require_current_user

	def show
		if(params[:id])
			@user = User.find(params[:id])
			@survey = @user.survey
			@friends = @user.friends
			render :show
		else
			redirect_to user_result_url(current_user)
		end
	end

end