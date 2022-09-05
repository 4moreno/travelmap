require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wishlists_show_url
    assert_response :success
  end
end
