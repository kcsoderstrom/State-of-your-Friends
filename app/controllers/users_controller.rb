class UsersController < ApplicationController
	def update
		@user = current_user
		if @user.update(params[:current_question_id])
			render json: @user
		else
			render json: @user.errors.full_messages, status: :unprocessable_entity
		end
	end
end
