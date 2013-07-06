class Borrower::InvitationsController < Devise::InvitationsController
  before_filter :authenticate_borrower!
  layout 'dashboard', :only => [:new]
  
  def create
    self.resource = resource_class.invite!(resource_params, current_inviter)

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      @message = current_borrower.messages.create(
        :content => self.resource.email,
        :subject => "Invite"
      )
      respond_with resource, :location => after_invite_path_for(resource)
    else
      render :new, :layout => 'dashboard'
    end
  end

  def update
    self.resource = resource_class.accept_invitation!(resource_params)

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                               
      set_flash_message :notice, flash_message
      @message = resource.messages.create(
        :content => resource.invited_by.email,
        :subject => "Invited"
      )
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
    else
      respond_with_navigational(resource){ render :edit }
    end
  end  
  
end
