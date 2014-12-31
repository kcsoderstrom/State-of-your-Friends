class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :session_token
      t.string :provider
      t.string :uid
      t.string :facebook_token
      t.integer :survey_id

      t.timestamps
    end
    
    add_index :uid, unique: true
    add_index :session_token, unique: true
  end
end
