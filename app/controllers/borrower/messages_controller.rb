class Borrower::MessagesController < Borrower::BaseController
  before_filter :authenticate_borrower!

  def index
    @messages = current_borrower.messages.order("created_at DESC")
    @messages.length
    @visitor_queries = current_borrower.messages.where(:status => false)
    @visitor_queries.update_all :status => true
  end
  
  def create
    message = current_borrower.messages.new(params[:message])

    if message.save
      flash[:notice] = 'Successfully sent your question'
    else
      flash[:error] = 'Your Question did not sent'
    end
  end
  
  def destroy
    @message = current_borrower.messages.where(:id => params[:id]).first
    @message.destroy
    respond_to do |format|
      format.html { 
        redirect_to borrower_messages_path,
        notice: 'Message was successfully deleted.' 
      }
    end
  end
  
end
