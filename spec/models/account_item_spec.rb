require 'spec_helper'

describe AccountItem do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  before { @account_item = product.account_items.build(user_id: user.id) } 


  subject { @account_item }

  it { should respond_to(:product_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:product) }
  its(:user) { should eq user } 
  its(:product) { should eq product }
  
  it { should be_valid }

  describe "when product_id is not present" do
    before { @account_item.product_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @account_item.user_id = nil }
    it { should_not be_valid }
  end


end
