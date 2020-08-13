name = Rails.application.credentials.user_name
pass = Rails.application.credentials.password

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  domain: "gmail.com",
  port: 587,
  user_name: "testmailer118835@gmail.com",
  password: "yrtqrqlsutjpbgon",
  authentication: 'login',
  enable_starttls_auto: true
}