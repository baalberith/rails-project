class CreateListMeaningLinks < ActiveRecord::Migration
  def self.up
    create_table :list_meaning_links do |t|
      t.integer :list_id
      t.integer :meaning_id

      t.timestamps
    end
  end

  def self.down
    drop_table :list_meaning_links
  end
end
