class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
    add_index :purposes, :name
  end
end
