class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :userable_id
      t.string :userable_type
      t.integer :subscription_type_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
