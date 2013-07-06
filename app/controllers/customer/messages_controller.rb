class Customer::MessagesController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    @childrens = current_customer.children
    @messages = current_customer.messages.order("created_at DESC")
    @messages.length
    @visitor_queries = current_customer.messages.where(:status => false)
    @visitor_queries.update_all :status => true
  end
  
  def create
    message = current_customer.messages.new(params[:message])
    
    respond_to do |format|
      if message.save
        format.js { 
          flash[:notice] = 'Successfully sent your message'
        }
      else
        format.js {
          flash[:error] = 'Your message did not sent'
        }
      end
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
