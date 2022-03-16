require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do 
   
    @user = User.create({
      :first_name => 'Ricky',
      :last_name => 'Bobby',
      :email => 'first_or_last@nascar.com',
      :password => 'ilovecrepes',
      :password_confirmation => 'ilovecrepes'
      })
  end

  scenario "can login" do 

    visit root_path

    click_link 'Login'
    
    fill_in 'email', with: 'first_or_last@nascar.com'
    fill_in 'password', with: 'ilovecrepes'
    
    click_button 'Login'
    
    expect(page).to have_content("Logout")
    save_screenshot



  end

end

