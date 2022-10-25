require "test_helper"

class EmailMailerTest < ActionMailer::TestCase
  test "confirmation_mail" do
    mail = EmailMailer.with(user: User.first).confirmation_mail(User.first)
    assert_equal "Confirmation mail", mail.subject
  end
end
