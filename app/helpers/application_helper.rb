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
    else 
      return "Last Name"
    end
  end  
  
end
