class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.date :expire_time
      t.boolean :is_valid, default: true
      t.integer :status, default: 0  #0: newly posted, 1: given, 2: out_of_date
      t.float :lat
      t.float :lng
      t.date :post_date
      t.references :user, index: true, foreign_key: true
      t.integer :receiver_id, references: "User"
      #add_foreign_key :items, :users, column: :receiver_id
      t.timestamps null: false
    end
  end
end
