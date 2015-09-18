class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
    @kaizen_count = @tag.kaizens.size
  end

  def edit
  end

  def update
  end

end
