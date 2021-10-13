class AddTraningIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :traning, null: false, foreign_key: true
  end
end
