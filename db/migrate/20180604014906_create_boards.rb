class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :sport_id
      t.date :do_date
      t.integer :area_id
      t.string :city
      t.date :closing_date
      t.string :place
      t.integer :max_people
      t.string :image_id
      t.text :introduction
      t.integer :manager_user_id
      t.integer :community_id
      t.integer :delete_flag
      t.string :qualification

      t.timestamps
    end
    add_index :boards, :name
    add_index :boards, :sport_id
    add_index :boards, :area_id
    add_index :boards, :city
    add_index :boards, :community_id
  end
end
