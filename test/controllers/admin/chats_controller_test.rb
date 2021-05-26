require 'test_helper'

class Admin::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_chats_show_url
    assert_response :success
  end
end
