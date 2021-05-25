require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase
  test "send_when_inquiry_received" do
    mail = InquiryMailer.send_when_inquiry_received
    assert_equal "Send when inquiry received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
