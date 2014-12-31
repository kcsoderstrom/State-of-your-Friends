class CreateDeletedQuestions < ActiveRecord::Migration
  def change
    create_table :deleted_questions do |t|
    	t.integer :user_id
    	t.integer :question_id
    	t.timestamps
    end

    add_index :deleted_questions, :user_id
    add_index :deleted_questions, :question_id
  end
end
