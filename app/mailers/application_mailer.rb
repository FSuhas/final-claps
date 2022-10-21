class ApplicationMailer < ActionMailer::Base
  prepend_view_path "app/views/devise/mailer"
  default from: "support@final-calps.io"
  layout 'mailer'

  def confirmation_instructions(user)
    @user = user
    mail(to: user.email, subject: "Please confirm your account", template_path: "devise/mailer", template_name: "confirmation_instructions")
  end
end
