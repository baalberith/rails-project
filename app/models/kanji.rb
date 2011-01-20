# == Schema Information
# Schema version: 20110116164316
#
# Table name: kanjis
#
#  id         :integer         not null, primary key
#  kanji      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Kanji < ActiveRecord::Base
  has_many :kanji_word_links
  has_many :words, :through => :kanji_word_links
  
  validates :kanji, :uniqueness => true
end
