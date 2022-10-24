class EmailMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  from = Email.new(email: 'fsuhas@gmx.com')
  to = Email.new(email: @user.email)
  subject = 'Corfirmation email'
  content = Content.new(type: 'text/plain',
    value: '<p>Bienvenue <%= @email %> !</p><p>Vous pouvez confirmer l adresse e-mail de votre compte via le lien ci-dessous :</p><p><%= link_to "Confirmer mon compte", confirmation_url(@user, confirmation_token: @token) %></p>')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers


  def confirmation_mail(user)
    @user = user
    @token = user.confirmation_token
    mail(to: @user.email, subject: 'Confirmation email')
  end
end
