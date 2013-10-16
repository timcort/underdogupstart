require 'spec_helper'

describe LineItem do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  let(:cart) { user.carts.create(user_id: user.id) }
  before { @line_item = cart.line_items.build(product_id: product.id) } 


  subject { @line_item }

  it { should respond_to(:product_id) }
  it { should respond_to(:cart_id) }
  it { should respond_to(:cart) }
  it { should respond_to(:product) }
  its(:product) { should eq product } 
  its(:cart) { should eq cart }
  
  it { should be_valid }

  describe "when product_id is not present" do
    before { @line_item.product_id = nil }
    it { should_not be_valid }
  end

  describe "when cart_id is not present" do
    before { @line_item.cart_id = nil }
    it { should_not be_valid }
  end
end
