class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :pic_url
      t.date :timeout
      t.integer :is_valid
      t.float :lat
      t.float :lng
      t.date :post_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
