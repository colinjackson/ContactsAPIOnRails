class CreateContactGroupings < ActiveRecord::Migration
  def change
    create_table :contact_groupings do |t|
      t.references :group, index: true
      t.references :contact, index: true

      t.timestamps
    end

    add_index :contact_groupings, [:group_id, :contact_id], unique: true
  end
end
