class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :big_image_id
      t.string :small_image_id
      t.string :introduction

      t.timestamps
    end
    add_index :sports, :name
  end
end
