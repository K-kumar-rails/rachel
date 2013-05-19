Cat::Application.routes.draw do
  devise_for :customers, 
    :controllers => {
      :registrations => "customer_registrations", 
      :passwords => "customer_passwords", 
      :sessions => "customer/sessions"
    }

  namespace 'customer' do
    resources 'dashboard' , :only => [:index]
    resource 'profile', :only => [:show] do
      put :change_password
      put :change_username
    end
    resources 'sub_profiles'
  end

  root :to => 'home#index'
end
