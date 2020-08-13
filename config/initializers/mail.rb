name = ENV['user_name']
pass = ENV['password']

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  domain: "gmail.com",
  port: 587,
  user_name: name,
  password: pass,
  authentication: 'login',
  enable_starttls_auto: true
}