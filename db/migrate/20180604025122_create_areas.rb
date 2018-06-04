class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :name_kana
      t.integer :region_id

      t.timestamps
    end
  end
end
