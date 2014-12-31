class SurveysController < ApplicationController
	def show
		@survey = Question.includes(:choices).includes(:responses).where(survey_id: current_user.survey_id)
		render :show
	end
end