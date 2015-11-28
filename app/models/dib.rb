# == Schema Information
#
# Table name: dibs
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dib < ActiveRecord::Base
  belongs_to :item, class_name: "Item"
  belongs_to :user, class_name: "User"

  validates :item_id, presence: true
  validates :user_id, presence: true
end
