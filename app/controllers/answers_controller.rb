class AnswersController < ApplicationController
  def new
    
  end

  def create
    question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      respond_to do |format|
        format.json
      end
    else
      render question_path
    end
  end

  def destroy
  end

  def show
  end

  private
  def answer_params
    params.require(:answer).permit(:answer).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
