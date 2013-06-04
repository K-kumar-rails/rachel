class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :customer_id
      t.string :subject
      t.text :content
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
