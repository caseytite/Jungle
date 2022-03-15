require 'rails_helper'

RSpec.describe Product, type: :model do
 
  describe 'Validations' do
    # validation tests/examples here

    before do
      @category = Category.create({:name => 'anything'})
     
    end
    
    it 'validates a product' do
      @product = Product.create({:name => 'anything', :price_cents => 10, :quantity => 1, :category => @category})
      expect(@product.valid?).to be true
    end

    it 'validates a product has a name' do
      @product = Product.create({:name => nil, :price_cents => 10, :quantity => 1, :category => @category})
      expect(@product.errors.full_messages).to be_present
    end

    it 'validates a product has a price' do
      @product = Product.create({:name => 'anything', :price_cents => nil, :quantity => 1, :category => @category})
      expect(@product.errors.full_messages).to be_present
    end

    it 'validates a product has a quantity' do
      @product = Product.create({:name => 'anything', :price_cents => 10, :quantity => nil, :category => @category})
      expect(@product.errors.full_messages).to be_present
    end

    it 'validates a product has a name' do
      @product = Product.create({:name => 'anything', :price_cents => 10, :quantity => 1, :category => nil})
      expect(@product.errors.full_messages).to be_present
    end
  end

end
