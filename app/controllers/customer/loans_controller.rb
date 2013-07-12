class Customer::LoansController < Customer::BaseController
  before_filter :authenticate_customer!

  def index
    @loans = current_customer.loans
  end

  def new
    @loan = current_customer.loans.new
    @childrens = current_customer.children
  end

  def create
    @loan = current_customer.loans.new
    
    respond_to do |format|
      if @loan.create(params[:loan])
         @loan.final_amount = @loan.calculate_interest
         @loan.save!
         
        format.html { 
          redirect_to edit_customer_loan_path, 
          notice: 'Action was successfully updated.' 
        }
      else
        format.html { 
          render action: "new" 
        }
      end
    end
  end
    
  def edit
    @loan = current_customer.loans
    @childrens = current_customer.children
  end

  def update
    @loan = current_customer.loans
    
    respond_to do |format|
      if @loan.update_attributes(params[:loan])
         @loan.final_amount = @loan.calculate_interest
         @loan.save!
         
        format.html { 
          redirect_to edit_customer_loan_path, 
          notice: 'Action was successfully updated.' 
        }
      else
        format.html { 
          render action: "edit" 
        }
      end
    end
  end

end
