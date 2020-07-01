class Users::Mailer < Devise::Mailer
  helper :application
  include Devise::ControllersUrlHelpers
  default template_path: 'devise/mailer'
  def confirmation_instructions(record, token, opts={})

    if record.unconfirmed_email != nil
      opts[:subject] = "【StudyShare】メールアドレス変更手続きを完了してください"
    else
      opts[:subject] = "【StudyShareアプリ】会員登録完了"
    end

    super
  end
end