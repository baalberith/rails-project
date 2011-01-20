# == Schema Information
# Schema version: 20110116164316
#
# Table name: lists
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :text
#

class List < ActiveRecord::Base
  belongs_to :user
  
  has_many :list_meaning_links, :dependent => :destroy
  has_many :meanings, :through => :list_meaning_links
  
  validates :name, :presence => true, :uniqueness => { :scope => :user_id }
end
