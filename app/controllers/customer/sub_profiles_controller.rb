class Customer::SubProfilesController < Customer::BaseController
  before_filter :authenticate_customer!
  before_filter :get_customer_obj, :except => [:index, :new, :create]
  
  def index
    @sub_accounts = current_customer.children
  end

  def show
    
  end

  def new
    @customer = current_customer.children.new
  end

  def edit
    
  end

  def create
    @customer = current_customer.children.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { 
          redirect_to customer_sub_profiles_path, 
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
      if @customer.update_attributes(params[:customer])
        format.html { 
          redirect_to customer_sub_profiles_path, 
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
    @customer.destroy
    respond_to do |format|
      format.html { 
        redirect_to customer_sub_profiles_path,
        notice: 'Account was successfully deleted.' 
      }
    end
  end
  
  
  private
  
  def get_customer_obj
    @customer = current_customer.children.find(params[:id])
    
    unless @customer.present?
      return redirect_to customer_sub_profiles_path,
        notice: 'You can not access requested account'
    end
  end
  
end
