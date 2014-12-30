class ResponsesController < ApplicationController
	def create
		response_params[:choice_ids].each do |choice_id|
			next unless choice_id.present?
			response = Response.new(choice_id: choice_id, user_id: current_user.id)
			response.displace_current_response
		end
		redirect_to survey_url
	end

	private
	def response_params
		params.require(:response).permit(choice_ids: [])
	end
end