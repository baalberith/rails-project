class AddNameAndDescriptionToList < ActiveRecord::Migration
  def self.up
    add_column :lists, :name, :string
    add_column :lists, :description, :text
  end

  def self.down
    remove_column :lists, :description
    remove_column :lists, :name
  end
end
