class User < ApplicationRecord
  has_secure_password #gives our User model authentication methods via bcrypt

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }, on: :create
  validates :email, :first_name, :last_name, presence: true

  validates :password, length: { minimum: 4 }, on: :create
  
  def self.authenticate_with_credentials(email, password)
    #authenticate # the authenticate instance method of the has_secure_password gem
    return self
  end

end
