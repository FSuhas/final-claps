class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  prepend_view_path "app/views/devise/mailer"
  default from: "fsuhas@gmx.com"
  layout 'mailer'


  def confirmation_instructions(user)
    @user = user
    mail(to: @user.email, subject: "Confirmation instructions", template_path: 'devise/mailer', template_name: 'confirmation_instructions')
  end
end
