module ApplicationHelper
  
  def error_message(err_msg, classes)
    unless err_msg.blank?
      content_tag(:div, :class=> classes) do
        list_items = err_msg.map { |msg| content_tag(:li, msg) }
        content_tag(:ul, content_tag(:a,'&times'.html_safe, :class=>"close", 'data-dismiss'=>"alert") + list_items.join.html_safe, :class=>"set_err_msg" )
      end
    end
  end
  
  def get_placeholder_field(field)
    if field === :email
      return "Email"
    elsif field === :first_name
      return "First Name"
    elsif field === :last_name
      return "Last Name"
    elsif field === :address
      return "Address"
    elsif field === :city
      return 'Enter city'
    elsif field === :state
      return 'Enter state'
    elsif field === :zip_code
      return 'Enter zip code'
    elsif field === :pupose_of_loan
      return 'Purpose of your loan'
    else
    
    end
    
  end  

  def unread_msg(current_customer)
    current_customer.messages.where(:status => false).size
  end
  
  def msg_body(message)
    if message.subject === "Invite"
      return "You send an invitation to #{message.content}"
    elsif message.subject === "Invited"
      return "You are invited by #{message.content}"
    else
      return message.content
    end
  end

  def msg_subject(message)
    if message.subject === "Invite"
      return "You invited an member"
    elsif message.subject === "Invited"
      return "You are invited"
    else
      return message.subject
    end
  end
  
end
