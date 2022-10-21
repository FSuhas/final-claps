class ApplicationMailer < ActionMailer::Base
  prepend_view_path 'app/views/devise/mailer'

  default from: 'fsuhas@gmx.com'
  layout 'mailer'

  def confirmation_instructions(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Final Claps!')

  end
end
