# == Schema Information
# Schema version: 20110116164316
#
# Table name: meanings
#
#  id         :integer         not null, primary key
#  meaning    :string(255)
#  word_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Meaning < ActiveRecord::Base
  belongs_to :word
  
  has_many :list_meaning_links, :dependent => :destroy
  has_many :lists, :through => :list_meaning_links
  
  validates :meaning, :presence => true, :uniqueness => { :scope => :word_id }
end
