class RenameStortsIdColumnToMySport < ActiveRecord::Migration[5.2]
  def change
  	rename_column :my_sports, :storts_id, :sport_id
  end
end
