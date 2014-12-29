class SurveysController < ApplicationController
	def show
		@survey = Question.where(survey_id: current_user.survey_id)
		render :show
	end
end