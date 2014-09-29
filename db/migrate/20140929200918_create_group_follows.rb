class CreateGroupFollows < ActiveRecord::Migration
  def change
    create_table :group_follows do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end

    add_index :group_follows, [:user_id, :group_id], unique: true
  end
end
