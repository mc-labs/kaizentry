class KaizensController < ApplicationController
  def index
    @kaizens = Kaizen.all
  end

  def new
    @kaizen = Kaizen.new
  end

  def show
  end

  def create
    @kaizen = Kaizen.new
    @kaizen.text = params[:text]
  end

  def edit
  end
end
