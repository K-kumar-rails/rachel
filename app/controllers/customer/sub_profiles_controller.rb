class Customer::SubProfilesController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    @customers = current_customer.children
  end

  def show
    @customer = current_customer.find(params[:id])
  end

  def new
    @customer = current_customer.children.new
  end

  def edit
    @customer = current_customer.children.find(params[:id])
  end

  def create
    @customer = current_customer.children.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { 
          redirect_to new_customer_sub_profile_path, notice: 'Sub account was successfully created.' 
        }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @customer = current_customer.children.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Auction was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @customer = current_customer.children.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
    end
  end
end
