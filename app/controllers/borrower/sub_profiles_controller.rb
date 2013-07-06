class Borrower::SubProfilesController < Borrower::BaseController
  before_filter :authenticate_borrower!
  before_filter :get_borrower_obj, :except => [:index, :new, :create]
  #before_filter :check_for_access_data, :except => [:index, :show]
  
  def index
    @sub_accounts = borrower.where(:invited_by_id => current_borrower.id)
  end

  def show
    
  end

  def new
    @borrower = current_parent.children.new
  end

  def edit
    
  end

  def create
    @borrower = current_parent.children.new(params[:borrower])

    respond_to do |format|
      if @borrower.save
        format.html { 
          redirect_to borrower_sub_profiles_path, 
          notice: 'Account was successfully created.' 
        }
      else
        format.html { 
          render action: "new" 
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @borrower.update_without_password(params[:borrower])
        format.html { 
          redirect_to borrower_sub_profiles_path, 
          notice: 'Account was successfully updated.' 
        }
      else
        format.html { 
          render action: "edit" 
        }
      end
    end
  end

  def destroy
    @borrower.destroy
    respond_to do |format|
      format.html { 
        redirect_to borrower_sub_profiles_path,
        notice: 'Account was successfully deleted.' 
      }
    end
  end
  
  
  private
  
  def get_borrower_obj
    @borrower = Borrower.where(:id => params[:id]).first
    
    unless @borrower.present?
      return redirect_to borrower_sub_profiles_path,
        notice: 'You can not access requested account'
    end
  end
  
  def check_for_access_data
    if is_access_data?
      flash[:notice] = 'You have limited access to requested account'
      redirect_to borrower_sub_profiles_path and return
    end
  end
end
