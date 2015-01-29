class AddCurrentQuestionIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :current_question_id, :integer
  end
end
