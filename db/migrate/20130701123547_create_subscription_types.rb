class CreateSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :number_of_days
      t.integer :number_of_loans
      
      t.timestamps
    end
  end
end
