class KanjisWords < ActiveRecord::Migration
  def self.up
    create_table :kanjis_words, :id => false do |t|
      t.integer :kanji_id
      t.integer :word_id
    end
  end
 
  def self.down
    drop_table :kanjis_words
  end
end
