class Message::TrackLoansController < Message::BaseController
  before_filter :authenticate_customer!

  def index
    
  end

end
