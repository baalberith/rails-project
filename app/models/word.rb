# == Schema Information
# Schema version: 20110116164316
#
# Table name: words
#
#  id         :integer         not null, primary key
#  word       :string(255)
#  reading    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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
