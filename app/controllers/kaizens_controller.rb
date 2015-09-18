class KaizensController < ApplicationController
  before_action :get_kaizen, only: [:show, :destroy, :edit, :update]
  def index
    @kaizens = Kaizen.order(created_at: :desc)
  end

  def new
    @kaizen = Kaizen.new
    @kaizen_tags = @kaizen.tags
  end

  def show
  end

  def create
    @kaizen = Kaizen.new kaizen_params
    user = User.find_by email: kaizen_user_params[:user][:email]
    if kaizen_user_params[:user][:email].empty?
      @kaizen.user = User.find_by email: "anonymous"
    elsif user.nil?
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

  def update
    user = @kaizen.user
    if user.nil?
      @kaizen.user = User.new kaizen_user_params[:user]
      @kaizen.user.save
    end
    if @kaizen.update kaizen_params
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
      params.require(:kaizen).permit(:text, :tag_list)
    end

    def kaizen_user_params
      params.require(:kaizen).permit(user: [:email])
    end

    def kaizen_tags_params
      params.require(:kaizen).permit(tags: [:name])
    end

    def get_kaizen
      @kaizen = Kaizen.find(params[:id])
    end

    # def create_tags
    #   kaizen_tags_params[:tags][:name].strip.split(/ *, */).each do |tag_name|
    #     tag = Tag.find_by name: tag_name
    #     if tag.nil?
    #       tag_to_add = Tag.new name: tag_name
    #       tag_to_add.save
    #     else
    #       tag_to_add = tag
    #     end
    #     @kaizen.tags << tag_to_add
    #   end
    # end

end
