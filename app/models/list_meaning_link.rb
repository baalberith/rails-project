class ListMeaningLink < ActiveRecord::Base
  belongs_to :list
  belongs_to :meaning
end
