class ResultsController < ApplicationController
	before_action :require_current_user

	def show
		if(params[:id])
			@user = User.find(:id)
			@survey = @user.survey
			@friends = @user.friends
			render :show
		else
			redirect_to results_url(current_user)
		end
	end

end