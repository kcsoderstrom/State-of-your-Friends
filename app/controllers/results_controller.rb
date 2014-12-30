class ResultsController < ApplicationController
	def show
		@survey = current_user.survey
		@friends = current_user.friends
		render :show
	end
end