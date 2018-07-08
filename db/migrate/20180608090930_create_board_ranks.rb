class CreateBoardRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :board_ranks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :board_id
      t.integer :rank_id

      t.timestamps
    end
    add_index :board_ranks, :board_id
    add_index :board_ranks, :rank_id
  end
end
