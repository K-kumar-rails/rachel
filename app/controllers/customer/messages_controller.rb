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
    if params[:message].present? && params[:message][:customer_id].present?
      c_params = {
        :customer_id => params[:message][:customer_id].to_i
      }
      @message = Message.new(params[:message].merge(c_params))
      
      respond_to do |format|
        if @message.save
          format.js { 
            flash.now[:notice] = 'Successfully sent your message'
          }
        else
          format.js {
            flash[:error] = @message.errors.full_messages.join("<br/>")
          }
        end
      end
    else
      flash.now[:alert] = 'Please select customer'
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
