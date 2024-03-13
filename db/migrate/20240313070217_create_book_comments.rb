class CreateBookComments < ActiveRecord::Migration[7.0]
  def change
    create_table :book_comments do |t|
      t.integer :book_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
