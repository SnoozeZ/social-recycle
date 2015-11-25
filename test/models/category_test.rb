# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:billjyc)
    @item = items(:item1)
    @item.user_id = @user.id;
    @item2 = items(:item2)
    @item2.user_id = @user.id;
    @category = categories(:category1)
  end

  test "category has many items" do
    @item.category_id = @category.id
    @item2.category_id = @category.id
    @item.save
    @item2.save
    #p @category.items
    #p @category.id
    assert @category.items.size==2
  end
end
