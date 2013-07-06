class SubscriptionType < ActiveRecord::Base
  attr_accessible :description, :name, :number_of_days, :price
end
