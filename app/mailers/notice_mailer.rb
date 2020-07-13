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

  def get_answer(answer_author, question, answer)
    @answer_author = answer_author
    @question_author = question.user
    @question = question
    @question_url = "http://localhost:3000/questions/#{question.id}"
    @answer = answer
    
    mail(
      from: 'system@example.com',
      to: @question_author.email,
      subject: '質問の回答が投稿されました！'
    )
  end
end
