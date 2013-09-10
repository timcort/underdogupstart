require 'spec_helper'

describe "Section Pages" do 

	let(:product) { FactoryGirl.create(:product) }

	subject {page}

	describe "new section page" do
		before { visit new_product_section_path(product_id: product.id) }
		it { should have_content('Create section')}
	end

	describe "create section" do
		before { visit new_product_section_path(product_id: product.id) }

		let(:submit) { "create section" }

		describe "with invalid information" do
			it "should not create section" do
				expect { click_button submit }.not_to change(Section, :count)
			end
		end


		describe "with valid information" do

			before do
				fill_in "Title", with: "Example title"
				fill_in "Sequence no", with: "1"
				fill_in "Description", with: "Example Description"
				fill_in "Video", with: '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>'
				fill_in "Notes", with: "Example notes"
			end

			it "should create a section" do
				expect { click_button submit }.to change(Section, :count).by(1)
			end
		end
	end
end