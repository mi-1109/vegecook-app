class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.send_when_inquiry_received.subject
  #
  def send_when_inquiry_received(user)
    @name = user.name
    mail to: user.email,
         subject: "【VegeCookより】お問い合わせありがとうございます"
  end
end
