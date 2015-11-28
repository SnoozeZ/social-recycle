require 'test_helper'

class UsersSignupTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "signup path" do
    get signup_path
    assert_template 'users/new'
  end
end
