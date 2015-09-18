class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update]
  def index
    @tags = Tag.all
  end

  def show
    @kaizen_count = @tag.kaizens.size
  end

  def edit
  end

  def update
    if @tag.update(user_params)
      redirect_to @tag, notice: 'Tag was updated successfully'
    else
      render :edit
    end
  end

  private
    def set_tag
      @tag = Tag.find params[:id]
    end

    def user_params
      params.require(:tag).permit(:name)
    end

end
