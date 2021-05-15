require 'test_helper'

class Public::PremiumsControllerTest < ActionDispatch::IntegrationTest
  test "should get payment" do
    get public_premiums_payment_url
    assert_response :success
  end

  test "should get complete" do
    get public_premiums_complete_url
    assert_response :success
  end

end
