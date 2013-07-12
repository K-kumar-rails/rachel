class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :customer_id
      t.float :amount
      t.float :loan_length
      t.integer :loan_type
      t.float :rate
      t.integer :rate_type
      t.integer :payment_frequency
      t.integer :payment_type
      t.datetime :loan_date
      t.boolean :auto_draft
      t.boolean :mailed
      t.float :final_amount

      t.timestamps
    end
  end
end
