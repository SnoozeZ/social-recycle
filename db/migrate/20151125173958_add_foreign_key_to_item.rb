class AddForeignKeyToItem < ActiveRecord::Migration
  def change
    #add_foreign_key :items, :users, column: :giver_id, primary_key: :id

  end
end
