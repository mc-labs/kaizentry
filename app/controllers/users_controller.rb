class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show]

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was updated successfully'
    else
      render :edit
    end
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end
end
