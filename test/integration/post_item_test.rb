require 'test_helper'

class PostItemTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @item = items(:item1)
    @category = categories(:two)
    @item.category_id = @category.id
  end

  test "post an valid item" do
    get post_item_path
    assert_template 'items/new'
    item = Item.new(name: "item1",
    description: "asdfasdf", expire_time: "2015-12-21")
  end
end
