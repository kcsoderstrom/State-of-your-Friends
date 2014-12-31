class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.text :body
    	t.integer :survey_id
      t.timestamps
    end

    add_index :survey_id
  end
end
