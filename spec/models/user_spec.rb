require 'rails_helper'
include BCrypt

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    
    it 'validates a user has the required information' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.com',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be true
      
    end

    it 'validates the password and password_confirmation match' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.com',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.password).to eq(@user.password_confirmation)
      
    end

    it 'validates the user is rejected when password and password_confirmation dont match' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.com',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovewaffles'
        })
        expect(@user.password).to_not eq(@user.password_confirmation)
      
    end
    
    it 'it rejects a signup with no first_name' do

      @user = User.create({
        :first_name => '',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.com',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with no last_name' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => '',
        :email => 'first_or_last@nascar.com',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with no email' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => '',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with no password' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.ca',
        :password => '',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with a password less then minimum length' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.ca',
        :password => 'i',
        :password_confirmation => 'ilovecrepes'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with a password_confirmation less then minimum length' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.ca',
        :password => 'ilovecrepes',
        :password_confirmation => 'i'
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup with no password_confirmation' do

      @user = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'first_or_last@nascar.ca',
        :password => 'ilovecrepes',
        :password_confirmation => ''
        })
        expect(@user.valid?).to be false
      
    end
    
    it 'it rejects a signup if the email already exists' do
      
      @user1 = User.create({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => '123@123.ca',
        :password => 'ilovecrepes',
        :password_confirmation => 'ilovecrepes'
        })
        
        @user2 = User.create({
          :first_name => 'Ron',
          :last_name => 'Burgundy',
          :email => '123@123.ca',
          :password => 'ilovescotch',
          :password_confirmation => 'ilovescotch'
          })
          
          expect(@user2.valid?).to be false
          
    end
  end 

  describe '.authenticate_with_credentials' do

    it'authenticates a valid user' do

      @user = User.create!({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'ricky-bobby.ca',
        :password => "ilovecrepes",
        :password_confirmation => "ilovecrepes"
        })
        
        @found_user = User.find_by_email('ricky-bobby.ca')
        @user_authenticated = User.authenticate_with_credentials(@user.email, @user.password)

        expect(@user_authenticated).to eq(@found_user)

    end
    
    it'rejects an invalid user email' do

      @user = User.create!({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'ricky-bobby.ca',
        :password => "ilovecrepes",
        :password_confirmation => "ilovecrepes"
        })
        
        @user_authenticated = User.authenticate_with_credentials('@user.email', @user.password)

        expect(@user_authenticated).to be nil

    end

    it'rejects an invalid user password' do

      @user = User.create!({
        :first_name => 'Ricky',
        :last_name => 'Bobby',
        :email => 'ricky-bobby.ca',
        :password => "ilovecrepes",
        :password_confirmation => "ilovecrepes"
        })
        
        @user_authenticated = User.authenticate_with_credentials(@user.email, 'notpassword')

        expect(@user_authenticated).to be nil

    end

  end

end
    
