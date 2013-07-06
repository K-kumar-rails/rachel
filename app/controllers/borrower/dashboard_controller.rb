class Borrower::DashboardController < Borrower::BaseController
  before_filter :authenticate_borrower!
  
  def index
  end
end
