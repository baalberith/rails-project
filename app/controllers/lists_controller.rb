class ListsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :authenticate_current!, :except => [:index, :show]
  
  def index
    @user = User.find(params[:user_id])
    @search = @user.lists.search(params[:search])
    @lists = @search.all.uniq.paginate(:per_page => 18, :page => params[:page])
  end
  
  def show
    @list = List.find(params[:id])
    @meanings = @list.meanings
    @words = words_on_a_list(@meanings)
  end
  
  def new
    @user = User.find(params[:user_id])
    @list = @user.lists.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.new(params[:list])
    
    if @list.save
      set_current_list_id(@list.id)
      redirect_to user_lists_path(@user), :notice => "List was successfully created."
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    
    if @list.update_attributes(params[:list])
      redirect_to user_lists_path(@user), :notice => "List was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    current_list_reset(@list)
    @user.lists.destroy(params[:id])
    
    redirect_to user_lists_path(@user), :notice => "List was successfully deleted."
  end
  
  def change
    @user = User.find(params[:user_id])
    set_current_list_id(params[:list_id].to_i)
    redirect_to :back, :notice => "List was successfully changed."
  end
  
  private
  
    def authenticate_current!
      @user = User.find(params[:user_id])
      redirect_to user_lists_path(current_user), :alert => "You need to sign in as authorized user." unless current_user == @user
    end
    
    def current_list_reset(list)
      session[:list_id] = nil if current_list_id == list.id
    end
    
    def words_on_a_list(meanings)
      words = []
      for meaning in meanings
        word = meaning.word
        words << word unless words.include?(word)
      end
      words
    end
end
