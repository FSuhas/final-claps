class ApplicationMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    user = User.first
    ApplicationMailer.confirmation_instructions(user)
  end
end
