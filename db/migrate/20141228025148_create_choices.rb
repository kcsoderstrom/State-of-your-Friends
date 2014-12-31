class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    	t.string :body
    	t.integer :question_id
    	
      t.timestamps
    end

    add_index :question_id
  end
end
