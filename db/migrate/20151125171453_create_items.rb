class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :pic_url
      t.date :timeout
      t.integer :valid
      t.float :lat
      t.integer :lng
      t.date :post_date

      t.timestamps null: false
    end
  end
end
