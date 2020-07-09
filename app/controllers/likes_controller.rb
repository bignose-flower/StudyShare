class LikesController < ApplicationController
  before_action :set_answer

  def create
    @like = current_user.likes.create(answer_id: params[:answer_id])
  end
  
  def destroy
    @like = Like.find_by(answer_id: params[:answer_id], user_id: current_user.id)
    @like.destroy
  end

  private
  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
