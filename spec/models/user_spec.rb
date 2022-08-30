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

    # this logic is not correct=> to be modified!!!
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
    end

    # it "takes emaill address and password as arguments" do
    #   expect(@user.email).to be_valid
    #   expect(@user.password).to be_valid
    # end

    # it "return an instance of user if successful authenticated" do
    #   expect(authenticate_with_credentials).success.to be @user
    # end

    # it "return nil if not authenticated" do
    #   expect(authenticate_with_credentials).fail.to be nil
    # end

    # # edge case 1
    # it "spaces in the front and back of the email should be success" do
    #   expect(authenticate_with_credentials).fail.to be nil
    # end

    # # edge case 2
    # it "wrong case of email should be sucess" do
    #   expect(authenticate_with_credentials).fail.to be nil
    # end

  end
end


