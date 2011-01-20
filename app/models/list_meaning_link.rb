# == Schema Information
# Schema version: 20110116164316
#
# Table name: list_meaning_links
#
#  id         :integer         not null, primary key
#  list_id    :integer
#  meaning_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ListMeaningLink < ActiveRecord::Base
  belongs_to :list
  belongs_to :meaning
end
