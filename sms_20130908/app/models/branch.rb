class Branch < ActiveRecord::Base
  attr_accessible :title

  paginates_per 20

  has_many :departments , :dependent=>:destroy
end
