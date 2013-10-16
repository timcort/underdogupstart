require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "user@example.com", password: "foobarbaz", 
    	password_confirmation: "foobarbaz")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:carts) }

  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin}

  # admin

	describe "with admin attribute set to true" do
		before do
			@user.save!
			@user.toggle!(:admin)
		end

		it { should be_admin }
	end

  #email

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end  

	describe "when email format is invalid" do
		it "should not be valid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp 
				a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	#password

	describe "when password is not present" do
		before do
			@user = User.new(email: "user@example.com",
							 password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "with a password that is too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	#associations

	describe "associations" do

		before do 
	    	@user.save 
	    	@product = FactoryGirl.create(:product)
		end

		describe "carts association" do
		    let!(:cart_one) do
		      FactoryGirl.create(:cart, user: @user)
		    end
		    let!(:cart_two) do
		      FactoryGirl.create(:cart, user: @user)
		    end
		    it "should destroy associated carts" do
		      carts = @user.carts.to_a
		      @user.destroy
		      expect(carts).not_to be_empty
		      carts.each do |cart|
			    expect(Cart.where(id: cart.id)).to be_empty
		      end
		    end
		end

		describe "account items association" do
		    let!(:account_item_one) do
		      FactoryGirl.create(:account_item, user: @user, product: @product)
		    end
		    let!(:account_item_two) do
		      FactoryGirl.create(:account_item, user: @user, product: @product)
		    end
		    it "should destroy associated account_items" do
		      account_items = @user.account_items.to_a
		      @user.destroy
		      expect(account_items).not_to be_empty
		      account_items.each do |account_item|
			    expect(AccountItem.where(id: account_item.id)).to be_empty
		      end
		    end
		end
	end
end
