# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview
  def confirmation_mail
    EmailMailer.confirmation_mail(User.first)
  end
end
