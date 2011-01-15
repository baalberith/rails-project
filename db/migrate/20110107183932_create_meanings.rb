class CreateMeanings < ActiveRecord::Migration
  def self.up
    create_table :meanings do |t|
      t.string :meaning
      t.integer :word_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meanings
  end
end
