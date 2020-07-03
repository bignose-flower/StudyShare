class QuestionsController < ApplicationController
  # before_action :authenticate_user?, except: [:index]
  def index
  end

  def new
    @subject = Subject.new
    @category_parent_array = ["---"]
    Subject.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category
    end
  end

  def create
    if Question.save(question_params)
      recirect_to 
    else
      render :new
    end
end
