require 'spec_helper'

describe Cart do
  let(:user) { FactoryGirl.create(:user) }
  before { @cart = user.carts.build(user_id: user.id) } 


  subject { @cart }

  it { should respond_to(:user_id) }
  it { should respond_to(:purchased_at) }
  it { should respond_to(:line_items) }
  it { should respond_to(:user) }
  its(:user) { should eq user } 

  it { should be_valid }

  describe "when user_id is not present" do
    before { @cart.user_id = nil }
    it { should_not be_valid }
  end

  describe "line_items association" do
    before { @cart.save } 
    let!(:line_item_one) do
      FactoryGirl.create(:line_item, cart: @cart)
    end
    let!(:line_item_two) do
      FactoryGirl.create(:line_item, cart: @cart)
    end
    it "should destroy associated line_items" do
      line_items = @cart.line_items.to_a
      @cart.destroy
      expect(line_items).not_to be_empty
      line_items.each do |line_item|
      expect(LineItem.where(id: line_item.id)).to be_empty
      end
    end
  end
end

