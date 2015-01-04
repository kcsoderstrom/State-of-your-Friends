class CreateUserSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :user_survey_questions do |t|
    	t.integer :user_id
    	t.integer :question_id
    	t.boolean :is_deleted, default: false
    	t.timestamps
    end

    add_index :user_survey_questions, :user_id
    add_index :user_survey_questions, :question_id
  end
end
