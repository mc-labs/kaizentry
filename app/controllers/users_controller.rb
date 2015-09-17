class UsersController < ApplicationController
  def index
  end
  def create
    @kaizen = Kaizen.find(params[:kaizen_id])
    
  end
end
