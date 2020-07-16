class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    render :show unless current_user.id == @user.id
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  def show
    @user_questions = Question.where(user_id: params[:id]).order(created_at: "DESC").page(params[:page]).per(15)
    @user_answers = Answer.where(user_id: params[:id]).order(created_at: "DESC").page(params[:page]).per(15)
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :job, :image, :email, :notice)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
