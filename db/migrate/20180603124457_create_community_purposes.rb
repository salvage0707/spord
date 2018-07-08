class CreateCommunityPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :community_purposes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :community_id
      t.integer :purpose_id

      t.timestamps
    end
    add_index :community_purposes, :community_id
    add_index :community_purposes, :purpose_id
  end
end
