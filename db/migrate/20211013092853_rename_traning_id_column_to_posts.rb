class RenameTraningIdColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :traning_id_id, :traning_id
  end
end
