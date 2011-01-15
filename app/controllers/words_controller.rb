class WordsController < ApplicationController
  can_edit_on_the_spot
  
  def index
    @words = Word.all
  end
  
  def new
    @word = Word.new
  end
  
  def create
    @word = Word.new(params[:word])

    if @word.save
      redirect_to new_word_meaning_path(@word), :notice => "Word was successfully created."
      
      @word.word.each_char do |c|
        if KLookup::Lookup::Kanji.exist?(c)
          kanji = @word.kanjis.new(:kanji => c)
          if kanji.save
            #
          else
            #
          end
        end
      end
      
    else
      render :new
    end
  end
  
  def destroy
    @word = Word.destroy(params[:id])
    
    redirect_to words_path, :notice => "Word was successfully deleted."
  end
end