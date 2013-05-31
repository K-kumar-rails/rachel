class InvitationsController < Devise::InvitationsController
  before_filter :authenticate_customer!
  layout 'dashboard', :only => [:new]
  
end
