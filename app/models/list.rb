class List < ActiveRecord::Base
  belongs_to :user
  
  has_many :list_meaning_links, :dependent => :destroy
  has_many :meanings, :through => :list_meaning_links
end
