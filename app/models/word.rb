class Word < ActiveRecord::Base
  has_many :meanings, :dependent => :destroy  
  
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
