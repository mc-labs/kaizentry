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
    @kaizen = Kaizen.new params.require(:kaizen).permit(:text)
    user = User.find_by email: params.require(:kaizen).permit(user: [:email])[:user][:email]
    if user.nil?
      @kaizen.user = User.new params.require(:kaizen).permit(user: [:email])[:user]
      # @kaizen.user.email = params.require(:kaizen).permit(user: [:email])[:user][:email]
      @kaizen.user.save
    else
      @kaizen.user = user
    end
    @kaizen.save
    redirect_to @kaizen
  end

  def edit
  end
end
