class Borrower::BorrowerRegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_borrower!, :only => [:update, :edit]
  layout 'dashboard', :only => [:edit, :update]

  def update
    # required for settings form to submit when password is left blank
    @borrower = current_borrower
    if @borrower.update_without_password(params[:borrower])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @borrower, :bypass => true
      redirect_to borrower_dashboard_index_path
    else
      render "edit_personal"
    end
  end

end
