class NoticeMailer < ApplicationMailer
  def posted_question(registered_user, posted_user, question)
    @registered_user = registered_user
    @posted_user = posted_user
    @question = question
    @question_url = "http://localhost:3000/questions/#{question.id}"
    
    mail(
      from: 'system@example.com',
      to: @registered_user.email,
      subject: '新しい質問が投稿されました！'
      )
  end
end
