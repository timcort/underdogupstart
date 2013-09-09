require 'spec_helper'

describe "Product Pages" do 

	subject {page}

	describe "new Product page" do
		before { visit new_product_path }
		it { should have_content('New Product') }
	end

	describe "create Product" do
		before { visit new_product_path }

		let(:submit) { "create product" }

		describe "with invalid information"  do
			it "should not create Product" do
				expect { click_button submit }.not_to change(Product, :count)
			end
		end
		describe "with valid information" do
			before do
				fill_in "Title", with: "Example title"
				fill_in "Heading", with: "Example heading"
				fill_in "Sub heading", with: "Example sub heading"
				fill_in "Price", with: "7"
				fill_in "Demo", with: '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>'
				fill_in "Benefits", with: "Example Benefits ABC 123"
			end

			it "should create a product" do
				expect { click_button submit }.to change(Product, :count).by(1)
			end
		end
	end
end
