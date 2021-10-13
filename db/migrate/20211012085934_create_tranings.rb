class CreateTranings < ActiveRecord::Migration[6.0]
  def change
    create_table :tranings do |t|
      t.text        :theme_text,    null: false
      t.references  :user,          foreign_key: true
      t.references  :post,          foreign_key: true
      t.timestamps
    end
  end
end
