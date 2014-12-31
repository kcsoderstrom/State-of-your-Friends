class ResultsController < ApplicationController
	before_action :require_current_user

	def show
		@survey = current_user.survey
		@friends = current_user.friends
		render :show
	end
end