class CreateMsgToCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :msg_to_communities do |t|
      t.integer :community_id
      t.integer :user_id
      t.string :message
      t.boolean :read

      t.timestamps
    end
    add_index :msg_to_communities, :community_id
    add_index :msg_to_communities, :read
  end
end