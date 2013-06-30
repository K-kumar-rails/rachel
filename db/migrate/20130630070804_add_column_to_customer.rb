class AddColumnToCustomer < ActiveRecord::Migration
  def up
    add_column :customers, :organization_name, :string
    add_column :customers, :pupose_of_loan, :text
    add_column :customers, :loan_agreement, :string
    add_column :customers, :avatar, :string
  end
  
  def down
    remove_column :customers, :organization_name
    remove_column :customers, :pupose_of_loan
    remove_column :customers, :loan_agreement
    remove_column :customers, :avatar
  end
end
