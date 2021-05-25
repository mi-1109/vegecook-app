class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILER_SENDER_NAME"],
          bcc: ENV['MAILER_EMAIL']
  layout 'mailer'
end
