class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.all.order(created_at: "DESC").page(params[:page]).per(7)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @question = Question.new
    @category_parent_array = Subject.where(ancestry: nil)
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

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: "DESC")
  end

  private
  def question_params
    if params[:grandchild_id].present?
      params[:question][:subject_id] = params[:grandchild_id]
    elsif params[:child_id].present?
      params[:question][:subject_id] = params[:child_id]  
    else  
    end
    params.require(:question).permit(:title, :question, :subject_id).merge(user_id: current_user.id)
  end
end
