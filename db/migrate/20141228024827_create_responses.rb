class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.integer :user_id
    	t.integer :choice_id
    	
      t.timestamps
    end

    add_index :user_id
    add_index :choice_id
  end
end
