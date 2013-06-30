class Customer::DashboardController < Customer::BaseController
  before_filter :authenticate_customer!
  
  def index
    @childrens = current_customer.children
  end
end
