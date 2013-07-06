class Borrower::ProfilesController < Borrower::BaseController
  before_filter :authenticate_borrower!

  def show
    @borrower = Borrower.find(current_borrower)
  end

  def change_password
    @resource = current_borrower
    is_update = @resource.update_with_password(
      :password => params[:borrower][:password],
      :password_confirmation => params[:borrower][:password_confirmation], 
      :current_password => params[:borrower][:current_password]
    )
    if is_update
      flash[:notice] = "Password updated successfully"
      sign_in @resource, :bypass => true
      redirect_to borrower_dashboard_index_path
    end
  end

  def change_username
    @resource = current_borrower
    is_update = @resource.update_without_password(:username => params[:borrower][:username])
    if @resource.update_without_password(:username => params[:borrower][:username])
      flash[:notice] = "Username updated successfully"
      sign_in @resource, :bypass => true
      redirect_to borrower_dashboard_index_path
    end
  end
end
