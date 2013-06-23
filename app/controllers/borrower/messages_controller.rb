class Borrower::MessagesController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    @messages = current_customer.messages.order("created_at DESC")
    @messages.length
    @visitor_queries = current_customer.messages.where(:status => false)
    @visitor_queries.update_all :status => true
  end
  
  def create
    message = current_customer.messages.new(params[:message])

    if message.save
      flash[:notice] = 'Successfully sent your question'
    else
      flash[:error] = 'Your Question did not sent'
    end
  end
  
  def destroy
    @message = current_customer.messages.where(:id => params[:id]).first
    @message.destroy
    respond_to do |format|
      format.html { 
        redirect_to customer_messages_path,
        notice: 'Message was successfully deleted.' 
      }
    end
  end
  
end
