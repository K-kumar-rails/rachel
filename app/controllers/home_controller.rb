class HomeController < ApplicationController
  #before_filter :authenticate_auction_admin!
  
  def index
  
  end
  
  def search
    @customers = Customer.user_search_by_keyword(params[:search_keyword])
  end
end
