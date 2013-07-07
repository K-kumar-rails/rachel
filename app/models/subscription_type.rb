class SubscriptionType < ActiveRecord::Base
  attr_accessible :description, :name, :number_of_days, :price, :number_of_loans
  
  has_many :subscriptions
  
  scope :free_plan, where("name = ?", "Free Plan")
  scope :standard_plan, where("name = ?", "Starter Kit")
  scope :pro_plan, where("name = ?", "Eutreprenuer")
  scope :ultra_plan, where("name = ?", "Loan Shark")
  
  scope :valid_plans, where("name != ?", "Free Plan")
end
