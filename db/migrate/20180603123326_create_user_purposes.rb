class CreateUserPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_purposes do |t|
      t.integer :user_id
      t.integer :purpose_id

      t.timestamps
    end
    add_index :user_purposes, :user_id
    add_index :user_purposes, :purpose_id
  end
end
