class CreateBoardPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :board_purposes do |t|
      t.integer :board_id
      t.integer :purpose_id

      t.timestamps
    end
    add_index :board_purposes, :board_id
    add_index :board_purposes, :purpose_id
  end
end
