class CreateKanjiWordLinks < ActiveRecord::Migration
  def self.up
    create_table :kanji_word_links do |t|
      t.integer :kanji_id
      t.integer :word_id

      t.timestamps
    end
  end

  def self.down
    drop_table :kanji_word_links
  end
end
