class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  prepend_view_path "app/views/devise/mailer"
  default from: "fsuhas@gmx.com"
  layout 'mailer'


  def confirmation_instructions(user)
    @user = user
    from = SendGrid::Email.new(email: 'fsuhas@gmx.com')
    to = SendGrid::Email.new(email: @user.email)
    subject = 'Confirmation instructions'
    content = SendGrid::Content.new(type: 'text/plain', value: attachments['confirmation_instructions.html.erb'])
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.parsed_body
    puts response.headers
  end
end
