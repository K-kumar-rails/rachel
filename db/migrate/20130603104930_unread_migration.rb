class UnreadMigration < ActiveRecord::Migration
  def self.up
    create_table :read_marks, :force => true do |t|
      t.integer  :readable_id
      t.integer  :customer_id,       :null => false
      t.string   :readable_type, :null => false, :limit => 20
      t.datetime :timestamp
    end

    #add_index :read_marks, [:customer_id, :readable_type, :readable_id]
  end

  def self.down
    drop_table :read_marks
  end
end
