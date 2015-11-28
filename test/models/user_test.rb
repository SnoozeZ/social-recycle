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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "billjyc", email: "yij071@ucsd.edu", phone: "8586990502", reg_time: "2015-12-01",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = "  "
    assert_not @user.valid?
  end


  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6;
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "should make and cancel dibs an item" do
    user = users(:billjyc)
    item = items(:item1)
    item.user_id = user.id
    assert_not user.made_dibs?(item)
    user.make_dibs(item)
    assert user.made_dibs?(item)
    assert item.dibs_users.include?(user)
    user.cancel_dibs(item)
    assert_not user.made_dibs?(item)
  end

end
