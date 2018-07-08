class CreateMySports < ActiveRecord::Migration[5.2]
  def change
    create_table :my_sports, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :storts_id
      t.integer :user_id
      t.integer :how_long
      t.integer :rank_id, default: 0

      t.timestamps
    end
    add_index :my_sports, :user_id
  end
end
