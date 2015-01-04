class SurveysController < ApplicationController
	before_action :require_current_user

	def show
		@survey = Question.includes(:choices)
											.includes(:responses)
											.joins(:user_survey_questions)
											.where("user_survey_questions.user_id = #{current_user.id}")
											.where("user_survey_questions.is_deleted = FALSE")
		render :show
	end
end