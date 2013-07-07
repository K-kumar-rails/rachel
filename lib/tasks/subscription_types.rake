namespace :subscription_types do

  desc "Inserting all subscription_types"
  task :insert => :environment do
    SubscriptionType.create( [
      {:name =>'Free Plan' , :description =>'', :price =>0, :number_of_loans =>0, :number_of_days => 0 },
      {:name => 'Starter Kit', :description =>'', :price =>30, :number_of_loans =>2, :number_of_days => 365 },
      {:name =>'Eutreprenuer' , :description =>'', :price =>100, :number_of_loans =>10, :number_of_days => 365 },
      {:name => 'Loan Shark', :description =>'', :price =>499, :number_of_loans => 0, :number_of_days => 365 }
    ])
  end

end


