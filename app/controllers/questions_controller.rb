class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @question = Question.new
    @subject = Subject.new
    @category_parent_array = ["---"]
    Subject.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category
    end
  end

  def create
    binding.pry
    @question = Question.new(question_params)
    if @question.save
      recirect_to user_questions_path(currnet_user.id)
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question, :subject)
  end
end
