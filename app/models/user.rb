class User < ApplicationRecord
  before_save :downcase_email

  # Validation of password
  validates :password, confirmation: true, length: { minimum: 4 }, on: :create
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :first_name, :last_name, presence: true
    
  # gives our User model authentication methods via bcrypt
  has_secure_password

  # class method of authentication
  def self.authenticate_with_credentials(email, password)
    #the authenticate instance method of the has_secure_password gem
    
    # to make all cases in the email address downcases
    email = email.downcase
    
    # to remove spaces in the email address 
    email = email.strip
    
    @user = self.find_by(email: email)
    
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
    
  end
  
  def downcase_email
    self.email = email.downcase
  end

end