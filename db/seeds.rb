# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create!([{body: "What is your name?", survey_id: 1},
														 {body: "What is your quest?", survey_id: 1},
														 {body: "What is your favorite color?", survey_id: 1},
														 {body: "What is the meaning of life, the universe, and everything?", survey_id: 1}])
questions.each do |question|
	5.times do |i|
		Choice.create!({body: "#{rand(10) / (i + 1).to_f} or maybe #{rand(4) * i}", question_id: question.id})
	end
end