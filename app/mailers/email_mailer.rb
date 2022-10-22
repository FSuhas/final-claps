class EmailMailer < ApplicationMailer

  def confirmation_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation email')
  end
end
