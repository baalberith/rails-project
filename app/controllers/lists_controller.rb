class ListsController < ApplicationController
  def new
    @user = User.find(current_user)
    @list = @user.lists.new
  end
  
  def create
  end
end
