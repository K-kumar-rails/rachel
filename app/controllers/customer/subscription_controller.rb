class Customer::SubscriptionController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    @plans = SubscriptionType.valid_plans.collect{ |p| [p.name, p.id] }
  end
  
end
