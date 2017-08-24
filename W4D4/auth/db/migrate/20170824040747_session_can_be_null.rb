class SessionCanBeNull < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, [:username, :password_digest]
    remove_index :users, :session_token
    add_index :users, :username, unique: true
    change_column :users, :session_token, :string, null: true
  end
end
