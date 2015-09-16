class KaizensController < ApplicationController
  def index
    @kaizens = Kaizen.all
  end

  def new
    @kaizen = Kaizen.new
  end

  def show
  end

  def edit
  end
end
