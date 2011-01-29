class WordsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_admin!, :only => [:destroy]
  
  def index
    @search = Word.search(params[:search])
    @words = @search.all.uniq.paginate(:per_page => 6, :page => params[:page])
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
      create_word_kanjis(@word)
    else
      render :new
    end
  end
  
  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    @word = Word.find(params[:id])

    if @word.update_attributes(params[:word])
      redirect_to words_path, :notice => "Word was successfully updated."
    else
      render :edit
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
    
    def create_word_kanjis(word)
      word.word.each_char do |c|
        if KLookup::Lookup::Kanji.exist?(c)
          kanji = word.kanjis.new(:kanji => c)
          if kanji.save
            kanji_obj = KLookup::Lookup::Kanji.new(kanji.kanji)
            kanji_obj.radical.each do |r|
              if KLookup::Lookup::Kanji.exist?(r)
                radical = Kanji.new(:kanji => r)
                unless radical.save
                  # do nothing
                end
              end
            end
          else
            kanji = Kanji.find_by_kanji(c)
          end
          word.kanji_word_links.create(:kanji_id => kanji.id)
        end
      end
    end
end
