require 'rails_helper'

RSpec.describe User, type: :model do
  # it 'a product with all four fields set save successfully' do
  #   @category = Category.new
  #   @category.save
  #   @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)

  #   @product.save!
  # end

  describe 'Validations' do

    it 'is valid with name attribute' do

      @category = Category.new
      @category.save
      @product = Product.new(name: 'Cliff Collard', price: 79.99, quantity: 1, category_id: @category.id)
      @product.name = nil 
      expect(@product).to_not be_valid

      expect(@product.errors.full_messages).to_not be_nil

    end

  end  end


