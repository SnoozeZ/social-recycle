# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string
#  email             :string
#  phone             :string
#  reg_time          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  password_digest   :string
#  activation_digest :string
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  reset_digest      :string
#  reset_sent_at     :datetime
#

class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {maximum: 50}
  has_many :dibs, class_name: "Dib",
           foreign_key: "user_id",
           dependent: :destroy
  has_many :dibs_item, through: :dibs, source: :item

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # dibs an item
  def make_dibs(item)
    dibs.create(item_id: item.id)
  end

  #cancel dibs of an item
  def cancel_dibs(item)
    dibs.find_by(item_id: item.id).destroy
  end

  # Returns true if the current user has dibs the item
  def made_dibs?(item)
    dibs_item.include?(item)
  end

  def self.user_daily_notify
    @user = User.all
    @user.each do |u|
      UserMailer.daily_notify(u).deliver_now
    end
  end
end
