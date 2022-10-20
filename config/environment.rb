# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ApplicationMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  domain: "final-claps.herokuapp.com",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
