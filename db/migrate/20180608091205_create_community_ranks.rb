class CreateCommunityRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :community_ranks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :community_id
      t.integer :rank_id

      t.timestamps
    end
    add_index :community_ranks, :community_id
    add_index :community_ranks, :rank_id
  end
end
