class TrackLoan < ActiveRecord::Base
  attr_accessible :customer_id, :customer_type, :name, :amount, :interest_rate, :loan_type, 
    :loan_term, :monthly, :yearly, :payments_made, :final_amount, :interest_from, 
    :payment_start_date
    
  #define associations
  belongs_to :customer
  
  PAYMENTMADE = { "Monthly" => 1, "Quarterly" => 2, "Annual" => 3 }
  
  def calculate_interest
    amount = self.amount
    rate = self.interest_rate
    final_amount = (amount*rate)/100
    return final_amount
  end
  
end
