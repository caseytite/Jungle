# require 'rails_helper'

# RSpec.feature "Visitor navigates to a products detail page", type: :feature, js: true do
  
#   before :each do 
#     @category = Category.create! name: 'Apparel'
    

#     1.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         image: open_asset("apparel1.jpg"),
#         quantity: 10,
#         price: 64.99
#       )
#     end
#   end


#   scenario "they see a products detail" do

#     visit root_path

#     click_link 'Details'

#     expect(page).to have_content('Quantity')

#     save_screenshot
    
#   end

# end
