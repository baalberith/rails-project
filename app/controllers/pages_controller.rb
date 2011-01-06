class PagesController < ApplicationController
  def home
  end
  
  def about
    @meanings = "富: #{KLookup::Lookup::Kanji.new('富').meaning.join(", ")}"
  end
end
