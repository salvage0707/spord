class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes do |t|
      t.string :name

      t.timestamps
    end
    add_index :purposes, :name
  end
end
