require "test_helper"

class BookUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_users_index_url
    assert_response :success
  end

  test "should get show" do
    get book_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get book_users_edit_url
    assert_response :success
  end
end
