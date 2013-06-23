class Customer::BaseController < ApplicationController
  layout "dashboard"
  #before_filter :initilize
  
  private
  def initilize
    @children = current_customer.parent.blank? ? current_customer.parent : current_customer.children
  end
end
