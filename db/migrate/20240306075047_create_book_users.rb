class CreateBookUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_users do |t|
      t.integer :account_id
      t.text :name
      t.text :postal_code
      t.text :address
      t.text :self_introduction

      t.timestamps
    end
  end
end
