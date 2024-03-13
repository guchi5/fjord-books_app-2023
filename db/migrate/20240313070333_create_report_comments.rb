class CreateReportComments < ActiveRecord::Migration[7.0]
  def change
    create_table :report_comments do |t|
      t.integer :report_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
