ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  domain: "gmail.com",
  port: 587,
  user_name: Rails.application.credentials.user_name,
  password: Rails.application.credentials.password,
  authentication: 'login',
  enable_starttls_auto: true
}