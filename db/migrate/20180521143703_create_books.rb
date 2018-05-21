class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genre
      t.string :author
      t.string :image
      t.string :tittle
      t.string :publisher
      t.string :year

      t.timestamps
    end
  end
end
