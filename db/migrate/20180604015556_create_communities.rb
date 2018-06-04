class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name
      t.integer :sports_id
      t.string :active_date
      t.integer :area_id
      t.string :city
      t.integer :max_people
      t.string :qualification
      t.text :introduction
      t.string :image_id
      t.integer :delete_flag
      t.integer :manager_user_id

      t.timestamps
    end
    add_index :communities, :name
    add_index :communities, :sports_id
    add_index :communities, :area_id
    add_index :communities, :city
  end
end
