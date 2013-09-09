class Department < ActiveRecord::Base
  attr_accessible :branch_id, :title

  paginates_per 20
  belongs_to :branch

end
