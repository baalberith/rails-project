class Word < ActiveRecord::Base
  has_many :meanings, :dependent => :destroy  
  
  has_many :kanji_word_links, :dependent => :destroy  
  has_many :kanjis, :through => :kanji_word_links
  
  validates :word, 
    :uniqueness => { :case_sensitive => false }, 
    :unless => 'word.blank?'
  validates :reading, 
    :uniqueness => { :case_sensitive => false, :scope => :word }, 
    :unless => 'reading.blank?'
  
  validates :word, :presence => true, 
    :if => 'reading.blank?'
  validates :reading, :presence => true, 
    :if => 'word.blank?'
end
