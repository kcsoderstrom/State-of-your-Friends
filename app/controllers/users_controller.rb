class UsersController < ApplicationController
	def update
		@user = current_user
		if @user.update(params.permit(:current_question_id)) || @user.delete_question(params[:deleted_question_id])
			render json: { current_question_id: @user.current_question_id,
										 previous_question_count: @user.previous_questions.count,
										 next_question_count: @user.next_questions.count }
		else			
			render json: @user.errors.full_messages, status: :unprocessable_entity
		end
	end
end
