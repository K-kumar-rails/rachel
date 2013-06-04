class Customer::MessagesController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    #@messages = current_customer.messages
    @messages = current_customer.messages.order("created_at DESC")
    @messages.length
    @visitor_queries = current_customer.messages.where(:status => false)
    @visitor_queries.update_all :status => true
  end

end
