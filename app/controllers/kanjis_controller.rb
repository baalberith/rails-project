# encoding: UTF-8

class KanjisController < ApplicationController
  def index
    @kanjis = Kanji.all
  end
  
  def show
    @kanji = Kanji.find(params[:id])
  end
end
