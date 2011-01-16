class Kanji < ActiveRecord::Base
  has_many :kanji_word_links
  has_many :words, :through => :kanji_word_links
  
  validates :kanji, :uniqueness => true
end
