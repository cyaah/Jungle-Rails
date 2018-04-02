	require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
    	@category = Category.new(name: 'furniture') 	
    	@product = Product.new(name: 'Boots', price: $45, quantity: 1, category: @category)
    	@product.save
    end

    it "is not valid without a name" do
    	@product = Product.new(name: nil, price: $45, quantity: 1, category: @category)
    	expect(@product.valid?).to be false
		expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without a price" do 
    	@product = Product.new(name: 'book', price: nil, quantity: 1, category: @category)
    	expect(@product.valid?).to be false
    	expect(@product.errors.full_messages).to include("Price can't be blank")
    end	
    it "is not valid without a quantity" do
    	@product = Product.new(name: 'book', price: $45, quantity: nil, category: @category)
   		expect(@product.valid?).to be false 
   		expect(@product.errors.full_messages).to include("Quantity can't be blank")
   	end

    it "is not valid without a category" do
  	@product = Product.new(name: 'book', price: $45, quantity: 1, category: nil)
   	expect(@product.valid?).to be false 
   	expect(@product.errors.full_messages).to include("Category can't be blank")
   	end
  end
end
