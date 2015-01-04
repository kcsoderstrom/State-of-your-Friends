class Question < ActiveRecord::Base
	has_many :choices
	has_many :responses, through: :choices
	has_many :user_survey_questions
end
