class CreateMsgToBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :msg_to_boards do |t|
      t.integer :board_id
      t.integer :user_id
      t.string :message
      t.boolean :read

      t.timestamps
    end
    add_index :msg_to_boards, :board_id
    add_index :msg_to_boards, :read
  end
end
