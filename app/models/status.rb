class Status < ActiveRecord::Base
  attr_accessible :step_id, :is_complete
  belongs_to :step
  belongs_to :user
end