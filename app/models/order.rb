class Order < ActiveRecord::Base
  attr_accessible :tour_id, :user_id, :date_purchased
end