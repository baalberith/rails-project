class WordsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_admin!, :only => [:destroy]
  
  def index
    @words = Word.all
  end
  
  def show
    @word = Word.find(params[:id])
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
          @kanji = @word.kanjis.new(:kanji => c)
          unless @kanji.save
            @kanji = Kanji.find_by_kanji(c)
          end
          @word.kanji_word_links.create(:kanji_id => @kanji.id)
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
  
  private
    def authenticate_admin!
      redirect_to words_path, :alert => "You need to sign in as admin user." unless current_user.admin?
    end
end
