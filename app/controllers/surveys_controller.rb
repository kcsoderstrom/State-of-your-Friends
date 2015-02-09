class SurveysController < ApplicationController
	before_action :require_current_user

	def show
		current_user.update_attribute(:current_question_id, 1) unless current_user.current_question_id
		redirect_to survey_question_url(current_user.current_question)
	end

	def swap_current_question
		question = Question.find(params[:id])
		if question && current_user.current_question_id != question.id
			current_user.update_attribute(:current_question_id, question.id)
		end

		@survey = Question.includes(:choices)
									.includes(:responses)
									.joins(:user_survey_questions)
									.where("user_survey_questions.user_id = #{current_user.id}")
									.where("user_survey_questions.is_deleted = FALSE")
		render :show
	end
end