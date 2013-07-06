ActiveAdmin.register Customer do
  menu :label => "Customers", :parent => "Customer Settings", :priority => 1
  
  index do                            
    column :id
    column :first_name
    column :last_name
    column :username
    column :email                     
    default_actions              
    column "SignIn" do |admin|       
      link_to "SignIn", '#', :target => "_blank", :method => :post    
    end
  end                                 

  filter :first_name
  filter :last_name
  filter :username
  filter :email                       

  form do |f|                         
    f.inputs "Customer Details" do       
      f.input :first_name
      f.input :last_name
      f.input :username               
      f.input :email
      f.input :phone_number
      f.input :address, :input_html => { :rows => 4 }
      f.input :city
      f.input :state
      f.input :zip_code
      f.input :country
    end                               
    f.actions                         
  end                                 
  
end
