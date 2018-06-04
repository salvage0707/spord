class CreateCommunityUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :community_users do |t|
      t.integer :user_id
      t.integer :community_id
      t.integer :permission
      t.string :comment
      t.boolean :approval

      t.timestamps
    end
    add_index :community_users, :community_id
    add_index :community_users, :user_id
  end
end
