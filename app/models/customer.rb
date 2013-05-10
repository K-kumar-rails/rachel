class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  PROFILE_ATTRIBUTES = [:email, :first_name, :last_name, :address, :city, :state, :zip_code, :country, :username, :timezone]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :current_password, :remember_me, :first_name,
    :last_name, :username, :phone_number, :address, :city, :state, :zip_code, :country,
    :terms_of_service, :email_confirmation, :timezone, :login

  attr_accessor :current_password, :login
  validates :first_name, :presence => true, :format => { :with => /^[a-zA-Z ]+$/, :message => "Only letters allowed"  }
  validates :last_name, :presence => true, :format => { :with => /^[a-zA-Z ]+$/, :message => "Only letters allowed"  }
  validates :email, :presence => true, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :terms_of_service, :on => :create, :acceptance => true

  validates :username, :allow_blank => true, :uniqueness => true, :format => { :with => /^[\w]{4,}$/, :message => "should at-least contain 4 valid characters" }
  validates :phone_number, :format => { :with => /[+]{0,1}[\(\)\-0-9]*$/ }
  validates :city, :format => { :with => /^[a-zA-Z]*$/ , :message => "Only letters allowed" }
  validates :state, :format => {:with => /^[a-zA-Z]*$/, :message => "Only letters allowed"}
  validates :zip_code,  :format => { :with => /^[0-9]*$/ }
  validates :country, :format => { :with => /^[a-zA-Z ]*$/ , :message => "Only letters allowed" }


  has_many :authentications, :dependent => :delete_all

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    if auth['provider'] == 'facebook'
      self.email = auth['extra']['raw_info']['email']
      self.first_name = auth['extra']['raw_info']['first_name']
      self.last_name = auth['extra']['raw_info']['last_name']
      self.address = auth['extra']['raw_info']['location']['name'] if auth['extra']['raw_info']['location'].present?
    else
      self.email = auth['info']['email']
      self.first_name = auth['info']['first_name']
      self.last_name = auth['info']['last_name']
      self.address = auth['extra']['raw_info']['location']['name'] if auth['extra']['raw_info'].present?
    end
    # saving fb info into db
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  def is_profile_complete?
    @complete_attributes_count = 0
    PROFILE_ATTRIBUTES.each do |att|
      @complete_attributes_count += 1 if self[att].present?
    end
    @complete_attributes_count.to_i === PROFILE_ATTRIBUTES.size
  end

  def profile_complete_in_per
    return "100" if is_profile_complete? === true
    per = (@complete_attributes_count * 100) / PROFILE_ATTRIBUTES.size
    return per
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
