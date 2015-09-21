class KaizensController < ApplicationController
  before_action :get_kaizen, only: [:show, :destroy, :edit, :update]
  def index
    @search = Kaizen.search do
      fulltext params[:search]

      order_by :created_at, :desc
    end
    @kaizens = @search.results
  end

  def new
    @kaizen = Kaizen.new
    @kaizen_tags = @kaizen.tags
  end

  def show
  end

  def create
    @kaizen = Kaizen.new kaizen_params
    if @kaizen.save
      redirect_to @kaizen
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @kaizen.update kaizen_update_params
      redirect_to @kaizen
    else
      render :edit
    end
  end

  def destroy
    @kaizen.destroy
    redirect_to kaizens_path
  end

  private
    def kaizen_params
      params.require(:kaizen).permit(:text, :tag_list, :user_email)
    end

    def kaizen_update_params
      update_email_params = params.require(:kaizen).permit(:text, :tag_list).to_h
      update_email_params[:update_user_email] = params.require(:kaizen).permit(:user_email)[:user_email]
      update_email_params
    end

    def get_kaizen
      @kaizen = Kaizen.find(params[:id])
    end

end
