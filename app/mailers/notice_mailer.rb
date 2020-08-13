class NoticeMailer < ApplicationMailer
  default from: 'testmailer118835@gmail.com'
  def posted_question(registered_user, posted_user, question)
    @registered_user = registered_user
    @posted_user = posted_user
    @question = question
    @question_url = "http://studyshareapp.herokuapp.com/questions/#{question.id}"
    
    mail(
      to: @registered_user.email,
      subject: '新しい質問が投稿されました！'
      )
  end

  def get_answer(answer_author, question, answer)
    @answer_author = answer_author
    @question_author = question.user
    @question = question
    @question_url = "http://studyshareapp.herokuapp.com/questions/#{question.id}"
    @answer = answer
    
    mail(
      to: @question_author.email,
      subject: '質問の回答が投稿されました！'
    )
  end
end
