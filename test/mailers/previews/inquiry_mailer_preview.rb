# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inquiry_mailer/send_when_inquiry_received
  def send_when_inquiry_received
    InquiryMailer.send_when_inquiry_received
  end

end
