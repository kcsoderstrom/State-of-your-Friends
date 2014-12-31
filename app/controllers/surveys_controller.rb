class SurveysController < ApplicationController
	before_action :require_current_user

	def show
		@survey = Question.includes(:choices).includes(:responses).where(survey_id: current_user.survey_id)
		render :show
	end
end