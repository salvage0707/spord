class CreateMsgToBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :msg_to_boards, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :board_id
      t.integer :user_id
      t.string :message
      t.boolean :read, default: false

      t.timestamps
    end
    add_index :msg_to_boards, :board_id
    add_index :msg_to_boards, :read
  end
end
