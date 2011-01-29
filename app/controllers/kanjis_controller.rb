# encoding: UTF-8

class KanjisController < ApplicationController
  def index
    @kanjis = Kanji.all
  end
  
  def show
    @kanji = Kanji.find(params[:id])
    @kanji_obj = KLookup::Lookup::Kanji.new(@kanji.kanji)
  end
end
