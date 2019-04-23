class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.date :publish_date
      t.string :topic
      t.string :isbn
      t.integer :author_id

      t.timestamps
    end
  end
end
