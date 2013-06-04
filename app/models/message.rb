class Message < ActiveRecord::Base
  attr_accessible :content, :status, :subject
  #acts_as_readable :on => :created_at
  belongs_to :customer
  
end
