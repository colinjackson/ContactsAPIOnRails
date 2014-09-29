class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string,
    unique: true, null: false

    add_index :users, :username, unique: true
  end
end
