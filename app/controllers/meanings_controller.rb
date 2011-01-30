class MeaningsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, :only => [:destroy]
  before_filter :set_current_list_id!, :only => [:add, :delete]
  
  # creates new words meaning
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
  
  # edit words meaning
  def edit
    @word = Word.find(params[:word_id])
    @meaning = Meaning.find(params[:id])
  end
  
  def update
    @word = Word.find(params[:word_id])
    @meaning = Meaning.find(params[:id])

    if @meaning.update_attributes(params[:meaning])
      redirect_to words_path, :notice => "Meaning was successfully updated."
    else
      render :edit
    end
  end
  
  # deletes meaning
  def destroy
    @word = Word.find(params[:word_id])
    @meaning = @word.meanings.destroy(params[:id])    
    
    redirect_to words_path, :notice => "Meaning was successfully deleted."
  end
  
  # adds meaning to selected words list
  def add
    list, meaning_id = current_list, params[:id].to_i
    @link = list.list_meaning_links.create(:meaning_id => meaning_id)
    if @link.save
      redirect_to words_path, :notice => "Meaning was successfully added to list."
    else
      redirect_to words_path, :alert => "Meaning already on the list."
    end
  end
  
  # deletes meaning form selected list
  def delete
    list, meaning_id = current_list, params[:id].to_i
    @link = list.list_meaning_links.find_by_meaning_id(meaning_id)
    @link.destroy
    redirect_to words_path, :notice => "Meaning was successfully deleted form list."
  end
  
  private
  
    # checks whether admin user is authenticated
    def authenticate_admin!
      redirect_to words_path, :alert => "You need to sign in as admin user." unless current_user.admin?
    end
    
    # checks whether current list id is set
    def set_current_list_id!
      redirect_to user_lists_path(current_user), :alert => "Current list not set" unless current_list_id_set?
    end
end
