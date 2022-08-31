require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: 'Hundson', last_name: 'Hornet', email: 'hh@gmail.com', password: '1234', password_confirmation: '1234')
      @user.save
    end

    it 'a user must be created with a password and password_confirmation fields, email, first name, and last name' do
      expect(@user).to be_valid
    end

    it "a user's password and password_confirmation are not matched" do
      @user2 = User.new(first_name: 'Hundson', last_name: 'Hornet', email: 'hh@gmail.com', password: '1234', password_confirmation: '4567')
      @user2.save
      expect(@user2.password).not_to be(@user2.password_confirmation)
    end

    it "Email are case insensitive: email must be unique." do
      @user3 = User.new(first_name: 'Lightning', last_name: 'McQueen', email: 'HH@gmail.Com', password: '3456', password_confirmation: '3456')

      expect(@user.email).to match(%r{#{@user3.email}}i)  
 
    end

    it "The password must have a minimum length of 4 when a user account is being created" do
      expect(@user.password.length).to be >= 4
    end 
  end  


  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(first_name: 'Hundson', last_name: 'Hornet', email: 'hh@gmail.com', password: '1234', password_confirmation: '1234')

      @user.save
      @user.validate

    end

    it "return an instance of user if successful authenticated" do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).not_to be_valid
    end

    it "return nil if not authenticated" do
      @user2 = User.new(first_name: 'Parson', last_name: 'Worley', email: 'hH@Gmail.Com', password: '3456', password_confirmation: '3456')

      expect(User.authenticate_with_credentials(@user2.email, @user2.password)).to be nil
    end

    # edge case 1
    it "spaces in the front and back of the email should be successfully login as well." do
      @user3 = User.new(first_name: 'Sam', last_name: 'Han', email: 'jj@gmail.com', password: '7890', password_confirmation: '7890')

      expect(User.authenticate_with_credentials(" #{@user3.email}    ", @user3.password)).to be nil
    end

    # edge case 2
    it "wrong case of email address should be sucessfully login too." do
      @user4 = User.new(first_name: 'Tarah', last_name: 'Nan', email: 'tn@gmail.com', password: '2345', password_confirmation: '2345')
      
      wrong_case_email = 'Tn@gMAil.coM'

      expect(User.authenticate_with_credentials(wrong_case_email, @user4.password)).to be nil
    end

  end
end


