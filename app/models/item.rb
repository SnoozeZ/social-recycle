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
require 'carrierwave/orm/activerecord'
class Item < ActiveRecord::Base
  attr_accessor :avatar_cache
  belongs_to :user
  belongs_to :category

  has_many :passive_dibs, class_name: "Dib",
           foreign_key: "item_id",
           dependent: :destroy
  has_many :dibs_users, through: :passive_dibs, source: :user

  #each item can only be sent to one receiver
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100}
  validates :description, presence: true, length: {maximum: 1024}
  validates :category, presence: true
  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  #ordering the item with default_scope
  default_scope -> { order(created_at: :desc)}

  mount_uploader :avatar, AvatarUploader

  def self.search(search)
    if search
      where 'title LIKE ?', "%#{search}%"
    else
      scoped
    end
  end

end
