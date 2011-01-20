class MeaningsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, :only => [:destroy]
  
  def new
    @word = Word.find(params[:word_id])
    @meaning = @word.meanings.new
  end
  
  def create
    @word = Word.find(params[:word_id])
    @meaning = @word.meanings.new(params[:meaning])
    
    if @meaning.save
      redirect_to new_word_meaning_path(@word), :notice => "Meaning was successfully created."
    else
      render :new
    end
  end
  
  def destroy
    @meaning = Meaning.destroy(params[:id])
    @word = Word.find(params[:word_id])
    
    redirect_to words_path, :notice => "Meaning was successfully deleted."
  end
  
  def add
    list, meaning_id = current_list, params[:id].to_i
    list.list_meaning_links.create(:meaning_id => meaning_id)
    redirect_to words_path, :notice => "Meaning was successfully added."
  end
  
  private
  
    def authenticate_admin!
      redirect_to words_path, :alert => "You need to sign in as admin user." unless current_user.admin?
    end
    
    def current_list
      session[:list]
    end
end
