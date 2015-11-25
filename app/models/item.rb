class Item < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "giver_id"
end
