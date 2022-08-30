require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'a product with all four fields set save successfully' do
    @category = Category.new
    @category.save
    @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)

    @product.save!
  end

  describe 'Validations' do

    it 'is valid with name attribute' do

      @category = Category.new
      @category.save
      @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)
      @product.name = nil 
      expect(@product).to_not be_valid

      expect(@product.errors.full_messages).to_not be_nil

    end

    it 'is valid with price attribute' do
      @category = Category.new
      @category.save
      @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)
      @product.price_cents = nil
      expect(@product).to_not be_valid

      expect(@product.errors.full_messages).to_not be_nil

    end

    it 'is valid with quantity attribute' do
      @category = Category.new
      @category.save
      @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)
      @product.quantity = nil 
      expect(@product).to_not be_valid

      expect(@product.errors.full_messages).to_not be_nil

    end

    it 'is valid with category attribute' do
      @category = Category.new
      @category.save
      @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)
      @product.category = nil 
      expect(@product).to_not be_valid

      expect(@product.errors.full_messages).to_not be_nil

    end

  end  
end
