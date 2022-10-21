class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  prepend_view_path "app/views/devise/mailer"
  layout 'mailer'
  default from: "fsuhas@gmx.com"

  def confirmation_instructions(user)
    @user = user
    mail(to: @user.email, subject: "Confirmation instructions", from: "fsuhas@gmx.com", template_type: "text/html", template_path: "devise/mailer", template_alias: "confirmation_instructions")
  end
end
