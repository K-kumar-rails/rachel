Cat::Application.routes.draw do
  root :to => 'home#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, 
    :controllers => {
      :registrations => "customer/customer_registrations", 
      :passwords => "customer/customer_passwords",
      :invitations => 'customer/invitations'
    }

  devise_for :borrowers, 
    :controllers => {
      :registrations => "borrower/borrower_registrations", 
      :passwords => "borrower/borrower_passwords",
      :invitations => 'borrower/invitations'
  }
    
  namespace 'customer' do
    resources 'dashboard' , :only => [:index]
    resource 'profile', :only => [:show] do
      put :change_password
      put :change_username
    end
    resources 'sub_profiles'
    resources 'messages'
    resources 'subscription', :only => [:index, :create]
  end
  
  namespace 'borrower' do
    resources 'dashboard' , :only => [:index]
    resource 'profile', :only => [:show] do
      put :change_password
      put :change_username
    end
    resources 'sub_profiles'
    resources 'messages'
  end

  namespace 'loan' do
    resource 'track_loans'
  end
  
  match '/search' => 'home#search'
  
  
  match '/signup_account' => 'home#signup_account'
  match '/signin_account' => 'home#signin_account'
  
end
