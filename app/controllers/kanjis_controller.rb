# encoding: UTF-8

class KanjisController < ApplicationController
  # lists all kanjis
  def index
    @search = Kanji.search(params[:search])
    @kanjis = @search.all.paginate(:per_page => 169, :page => params[:page])
  end
  
  # shows all details of selected kanji
  def show
    @kanji = Kanji.find(params[:id])
    @kanji_obj = KLookup::Lookup::Kanji.new(@kanji.kanji)
    @radicals = kanji_radicals(@kanji_obj)
    @examples = @kanji.words
  end
  
  private
    
    # makes list of kanji radicals
    def kanji_radicals(kanji_obj)
      radicals = []
      kanji_obj.radical.each do |r|
        radical = Kanji.find_by_kanji(r.to_s)
        unless radical.nil?
          radicals << radical unless kanji_obj == r
        else
          radicals << r.to_s
        end
      end
      radicals
    end
end
