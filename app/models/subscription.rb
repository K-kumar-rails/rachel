class Subscription < ActiveRecord::Base
  attr_accessible :end_date, :start_date, :subscription_type_id, :userable_id, :userable_type
end
