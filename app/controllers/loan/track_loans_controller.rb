class Loan::TrackLoansController < Loan::BaseController
  before_filter :authenticate_customer!

  def edit
    @loan = current_customer.track_loan
  end

  def update
    @loan = current_customer.track_loan
    
    respond_to do |format|
      if @loan.update_attributes(params[:track_loan])
         @loan.final_amount = @loan.calculate_interest
         @loan.save!
         
        format.html { 
          redirect_to edit_loan_track_loan_path, 
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
