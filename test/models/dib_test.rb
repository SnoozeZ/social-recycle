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
end
