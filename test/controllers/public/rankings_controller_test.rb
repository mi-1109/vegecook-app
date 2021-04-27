require 'test_helper'

class Public::RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_rankings_index_url
    assert_response :success
  end

end
