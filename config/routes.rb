Cat::Application.routes.draw do
  devise_for :customers, 
    :controllers => {
      :registrations => "customer_registrations", 
      :passwords => "customer_passwords",
      :invitations => 'invitations'
    }

  namespace 'customer' do
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
  root :to => 'home#index'
end
