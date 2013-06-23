class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_parent
    if current_customer.present? && current_customer.parent.present?
      return current_customer.parent
    else
      return current_customer
    end
  end
  
  def is_access_data?
    if current_customer.present? && current_customer.parent.present?
      return true
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      return customer_dashboard_index_path
    elsif resource.is_a?(Borrower)
      return borrower_dashboard_index_path
    end
  end

  def after_update_path_for(resource)
    if resource.is_a?(Customer)
      return customer_dashboard_index_path
    elsif resource.is_a?(Borrower)
      return borrower_dashboard_index_path
    end
  end

end
