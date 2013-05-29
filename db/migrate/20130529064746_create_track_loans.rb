class CreateTrackLoans < ActiveRecord::Migration
  def change
    create_table :track_loans do |t|
      t.integer  :customer_id
      t.boolean  :customer_type
      t.string   :name
      t.float    :amount
      t.float    :interest_rate
      t.boolean  :loan_type
      t.float    :loan_term
      t.boolean  :monthly
      t.boolean  :yearly
      t.boolean  :payments_made
      t.float    :final_amount
      t.datetime :interest_from
      t.datetime :payment_start_date

      t.timestamps
    end
  end
end
