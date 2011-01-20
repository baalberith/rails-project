class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_current!, :except => [:index]
  
  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists.all
  end
  
#   def select
#     @user = User.find(params[:user_id])
#     set_current_list(params[:list_id].to_i)
#     redirect_to user_lists_path(@user), :notice => "List was successfully selected."
#   end
  
  def select
    @user = User.find(params[:user_id])
    set_current_list(params[:id].to_i)
    redirect_to user_lists_path(@user), :notice => "List was successfully selected."
  end
  
  def new
    @user = User.find(params[:user_id])
    session[:list]
    @list = @user.lists.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.new(params[:list])
    
    if @list.save
      redirect_to user_lists_path(@user), :notice => "List was successfully created."
    else
      render :new
    end
  end
  
  private
  
    def authenticate_current!
      @user = User.find(params[:user_id])
      redirect_to user_lists_path(current_user), :alert => "You need to sign in as authorized user." unless current_user == @user
    end
    
    def set_current_list(list_id)
      session[:list] = List.find(list_id)
    end
end
