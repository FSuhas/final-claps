class EmailMailer < ApplicationMailer

  def confirmation_mail(user)
    @user = user
    @resource = user
    @token = @user.confirmation_token
    mail(to: @user.email, subject: 'Confirmation email')
  end
end
