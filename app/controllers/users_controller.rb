class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :show]

  def edit
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :job, :image, :email)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
