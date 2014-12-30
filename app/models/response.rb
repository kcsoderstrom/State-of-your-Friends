class Response < ActiveRecord::Base
	belongs_to :choice
	belongs_to :user

	def current_response
		current_responses = Response.find_by_sql(<<-SQL
			SELECT
				user_responses.*
			FROM (
				SELECT
					responses.*
				FROM
					responses
				WHERE
					responses.user_id = #{user.id}
			) AS user_responses
			JOIN
				choices
			ON
				user_responses.choice_id = choices.id
			WHERE
				choices.question_id = #{choice.question_id}
			LIMIT 1;
		SQL
		)

		current_responses.length > 0 ? current_responses.first : nil
		# Remove the .first if you want lazy evaluation.
	end

	def displace_current_response
		to_displace = current_response

		if to_displace.nil?
			self.save
			return
		end

		return if to_displace.id == self.id

		to_displace.destroy
		self.save
	end

end
