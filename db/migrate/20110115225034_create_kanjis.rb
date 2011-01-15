class CreateKanjis < ActiveRecord::Migration
  def self.up
    create_table :kanjis do |t|
      t.string :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :kanjis
  end
end
