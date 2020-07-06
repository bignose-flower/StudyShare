class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @question = Question.new
    @category_parent_array = Subject.where(ancestry: nil)
  end

  def get_preview
    @question = Question.new(question_params)
    render :new if @question.invalid?
  end

  def create
    @question = Question.new(question_params)
    if @question.save
    else
      render :new
    end
  end

  def get_category_children
    @category_children = Subject.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Subject.find("#{params[:child_id]}").children
  end

  private
  def question_params
    # subject_id = Subject.where(category: params[:subject_id])
    params.require(:question).permit(:title, :question, :subject_id).merge(user_id: current_user.id)
  end
end
