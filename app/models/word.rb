class Word < ActiveRecord::Base
  has_many :meanings, :dependent => :destroy  
  has_and_belongs_to_many :kanjis
  
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
