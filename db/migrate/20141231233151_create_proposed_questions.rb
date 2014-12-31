class CreateProposedQuestions < ActiveRecord::Migration
  def change
    create_table :proposed_survey_questions do |t|
    	t.integer :user_id
    	t.integer :question_id
    	t.timestamps
    end

    add_index :proposed_survey_questions, :user_id
    add_index :proposed_survey_questions, :question_id
  end
end
