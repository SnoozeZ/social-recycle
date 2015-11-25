class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100}
  validates :description, presence: true, length: {maximum: 1024}

  #ordering the item with default_scope
  default_scope -> { order(created_at: :desc)}
end
