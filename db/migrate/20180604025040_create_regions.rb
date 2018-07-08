class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :name_kana

      t.timestamps
    end
  end
end
