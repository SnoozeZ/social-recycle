class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.date :timeout
      t.boolean :is_valid, default: true
      t.float :lat
      t.float :lng
      t.date :post_date
      t.references :user, index: true, foreign_key: true
      #t.integer :receiver_id
      #add_foreign_key :items, :users, column: :receiver_id
      t.timestamps null: false
    end
  end
end
