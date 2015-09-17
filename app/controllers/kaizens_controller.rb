class KaizensController < ApplicationController
  before_action :get_kaizen, only: [:show, :destroy, :edit]
  def index
    @kaizens = Kaizen.all
  end

  def new
    @kaizen = Kaizen.new
  end

  def show
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
    if @kaizen.save
      redirect_to @kaizen
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @kaizen.destroy
    redirect_to kaizens_path
  end

  private
    def kaizen_params
      params.require(:kaizen).permit(:text)
    end

    def kaizen_user_params
      params.require(:kaizen).permit(user: [:email])
    end

    def get_kaizen
      @kaizen = Kaizen.find(params[:id])
    end

end
