class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@advice.com'
  layout 'mailer'
end
