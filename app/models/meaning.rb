class Meaning < ActiveRecord::Base
  belongs_to :word
  
  has_many :list_meaning_links, :dependent => :destroy
  has_many :lists, :through => :list_meaning_links
  
  validates :meaning, :presence => true, :uniqueness => { :scope => :word_id }
end
