class Loan < ActiveRecord::Base
  attr_accessible :amount, :auto_draft, :customer_id, :loan_date, :loan_length, :loan_type, 
    :mailed, :payment_frequency, :payment_type, :rate, :rate_type
    
  belongs_to :customer
  
  LOAN_TYPE = { "Indifinate" => 1, "One Time" => 2, "Yearly" => 3, "Monthly" => 4 }
  RATE_TYPE = { "One Time" => 1, "Simple" => 2, "Compound" => 3, "Monthly" => 4 }
  PAYMENT_FREQUENCY = { "Once" => 1, "Weekly" => 2, "Monthly" => 3, "Yearly" => 4 }
  PAYMENT_TYPE = { "Principal + Interest" => 1, "Interest" => 2 }
  
end
