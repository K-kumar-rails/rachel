class Customer::SessionsController < Devise::SessionsController

  def create
    if warden.authenticate.parent.present?
      self.resource = warden.authenticate.parent
    else
      self.resource = warden.authenticate!(auth_options)
    end
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

end

