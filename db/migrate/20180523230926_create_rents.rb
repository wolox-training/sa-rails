class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, null: false, default: "user_id"
      t.references :book, foreign_key: true, null: false, default: "book_id"
      t.date :from, null: false, default: Date.current()
      t.date :to, null: false, default: Date.current()
      t.timestamps
    end
  end
end
