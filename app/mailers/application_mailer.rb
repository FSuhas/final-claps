class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  prepend_view_path "app/views/devise/mailer"
  default from: "fsuhas@gmx.com"
  layout 'mailer'




  def confirmation_instructions(user)
    @user = user
    mail(to: user.email, subject: "Please confirm your account", template_path: "devise/mailer", template_name: "confirmation_instructions")
    from = SendGrid::Email.new(email: 'test@exemple.com')
    to = SendGrid::Email.new(email: 'test@expemple.com')
    subject = 'Sending with SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.parsed_body
    puts response.headers
  end
end
