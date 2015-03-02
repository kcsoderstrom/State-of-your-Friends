class RemoveSurveyIdFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :survey_id
  end
end
