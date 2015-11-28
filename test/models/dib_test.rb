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

require 'test_helper'

class DibTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:billjyc)
    @item = items(:item1)
    @item.user_id = @user.id;
    @dibs = Dib.new(user_id: @user.id, item_id: @item.id)
  end

  test "dibs is valid" do
    assert @dibs.valid?
  end

  test "should require a user id" do
    @dibs.user_id = nil
    assert_not @dibs.valid?
  end

  test "should require a item id" do
    @dibs.item_id = nil
    assert_not @dibs.valid?
  end
end
