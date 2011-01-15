class KanjisController < ApplicationController
  def index
    @kanjis = Kanji.all
  end
end
