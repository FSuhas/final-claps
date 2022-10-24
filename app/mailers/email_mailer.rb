class EmailMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  def confirmation_mail(user)
    @user = user
    @token = user.confirmation_token
    mail(to: @user.email, subject: 'Confirmation email')

    from = Email.new(email: 'fsuhas@gmx.com')
    to = Email.new(email: @user.email)
    subject = 'Confirmation email'
    content = Content.new(type: 'text/html', value: 'Bonjour #{user.name}, merci de confirmer votre compte en cliquant sur ce lien: https://final-claps.herokuapp.com/users/confirmation?confirmation_token=#{user.confirmation_token}. A bientôt sur Final Claps !')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
