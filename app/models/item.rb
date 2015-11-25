# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  pic_url     :string
#  timeout     :date
#  is_valid    :integer
#  lat         :float
#  lng         :float
#  post_date   :date
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100}
  validates :description, presence: true, length: {maximum: 1024}

  #ordering the item with default_scope
  default_scope -> { order(created_at: :desc)}
end
