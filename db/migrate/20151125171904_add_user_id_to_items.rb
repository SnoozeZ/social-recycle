class AddUserIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :giver_id, :integer
    rename_column :items, :valid, :is_valid
    #add_foreign_key :items, :users, column: :giver_id, primary_key: :user_id
  end
end
