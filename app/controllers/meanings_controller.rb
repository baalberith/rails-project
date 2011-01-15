class MeaningsController < ApplicationController
  can_edit_on_the_spot
  
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
end
