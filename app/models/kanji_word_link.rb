class KanjiWordLink < ActiveRecord::Base
  belongs_to :kanji
  belongs_to :word
end
