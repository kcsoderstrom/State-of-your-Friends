class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
    	t.integer :user_id
    	t.integer :friend_id
    	
      t.timestamps
    end

    add_index :user_id
    add_index :friend_id
  end
end
