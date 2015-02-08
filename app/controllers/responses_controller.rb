class ResponsesController < ApplicationController
	def create
		response = Response.new(choice_id: params[:choice_id], user_id: current_user.id)
		response.displace_current_response
		redirect_to survey_url
	end
end