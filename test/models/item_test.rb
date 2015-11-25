require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:billjyc)
    @item = Item.new(title: "aaa", description: "daslfjdaslfjasfkj", pic_url: "aaa.com/image",
                    timeout: "2015-11-11", is_valid: 1, lat: 111.11, lng: 123.32, post_date: "2015-12-22", user_id:
                    @user.id)
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "user id should be present" do
    @item.user_id = nil
    assert_not @item.valid?
  end

  test "description should be present" do
    @item.description = " "
    assert_not @item.valid?
  end
end