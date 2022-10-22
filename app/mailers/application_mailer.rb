class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  prepend_view_path "app/views/devise/mailer"
  layout 'mailer'
  default from: "fsuhas@gmx.com"




  def confirmation_instructions(user)
    @user = user
    # from = 'fsuhas@gmx.com'
    # to = @user.email
    # subject = 'Support Final Claps'
    # content = Content.new(type: 'text/plain')

    # mail = Mail.new(from, subject, to, content)
    mail(to: @user.email, from: 'fsuhas@gmx.com', subject: 'Support Final Claps', template_path: "devise/mailer", template_name: "confirmation_instructions")

    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
  end
end
