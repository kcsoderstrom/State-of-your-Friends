class CreateUserProposedQuestions < ActiveRecord::Migration
  def change
    create_table :user_proposed_questions do |t|
    	t.integer :user_id
    	t.integer :question_id
    	t.timestamps
    end

    add_index :user_proposed_questions, :user_id
    add_index :user_proposed_questions, :question_id
  end
end
