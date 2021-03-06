# == Schema Information
# Schema version: 20110116164316
#
# Table name: kanji_word_links
#
#  id         :integer         not null, primary key
#  kanji_id   :integer
#  word_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class KanjiWordLink < ActiveRecord::Base
  belongs_to :kanji
  belongs_to :word
end
