class Customer::SessionsController < Devise::SessionsController

  def create
    customer = Customer.where(:email=>params[:customer]["login"]).first
    unless customer.present?
      flash[:error] = "Invalid username or password"
      redirect_to new_customer_session_path and return
    end 
    
    if warden.authenticate.present? && warden.authenticate.parent.present?
      self.resource = warden.authenticate.parent
    else
      self.resource = warden.authenticate!(auth_options)
    end
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

end

