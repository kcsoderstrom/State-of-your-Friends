class ResponsesController < ApplicationController
	def create
		response_params[:choise_ids].each do |choice_id|
			# Delete any old responses for that question
			# if the choice is different.
			# Add the choice.
		end
		redirect_to survey_url
	end

	private
	def response_params
		params.require(:response).permit(choice_ids: [])
	end
end