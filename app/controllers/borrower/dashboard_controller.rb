class Borrower::DashboardController < Customer::BaseController
  before_filter :authenticate_borrower!
  
  def index
  end
end
