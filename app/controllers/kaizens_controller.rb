class KaizensController < ApplicationController
  def index
    @kaizens = Kaizen.all
  end

  def new
    @kaizen = Kaizen.new
  end

  def show
    @kaizen = Kaizen.find params[:id]
  end

  def create
    @kaizen = Kaizen.new kaizen_params
    user = User.find_by email: kaizen_user_params[:user][:email]
    if user.nil?
      @kaizen.user = User.new kaizen_user_params[:user]
      @kaizen.user.save
    else
      @kaizen.user = user
    end
    @kaizen.save
    redirect_to @kaizen
  end

  def edit
  end

  def destroy
  end

  private
    def kaizen_params
      params.require(:kaizen).permit(:text)
    end

    def kaizen_user_params
      params.require(:kaizen).permit(user: [:email])
    end

end
