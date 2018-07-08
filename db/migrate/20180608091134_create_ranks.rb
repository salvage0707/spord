class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
  end
end
