class CreateMsgToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :msg_to_users, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :to_user_id
      t.integer :user_id
      t.string :message
      t.boolean :read, default: false

      t.timestamps
    end
    add_index :msg_to_users, :to_user_id
    add_index :msg_to_users, :read
  end
end
