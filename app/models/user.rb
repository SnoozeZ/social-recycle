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
  attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest
  validates :username, presence: true, length: {maximum: 50}
  has_many :dibs, class_name: "Dib",
           foreign_key: "user_id",
           dependent: :destroy
  has_many :dibs_item, through: :dibs, source: :item

  has_many :received_items, class_name: "Item", foreign_key: "receiver_id"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@(eng.)?ucsd.edu/i
  validates :email, presence: true, length: {maximum: 50},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true


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

  def create_reset_digest
    self.reset_token  = User.new_token
    self.reset_digest = User.digest(reset_token)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  private

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
