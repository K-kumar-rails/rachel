class Message < ActiveRecord::Base
  attr_accessible :content, :status, :subject, :customer_id
  
  belongs_to :customer
  validates :subject, :presence => true
  validates :content, :presence => true
  
end
