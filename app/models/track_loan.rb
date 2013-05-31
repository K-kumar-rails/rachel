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

  def calculate_interest
    amount = self.amount
    rate = self.interest_rate
    term = self.loan_term
    final_amount = (amount*rate*term)/(12*100) if self.is_monthly?
    final_amount = (amount*rate*term)/100 if self.is_yearly?
    return final_amount
  end
  
  def is_monthly?
    self.monthly === true
  end
  
  def is_yearly?
    self.yearly === true
  end
    
end
