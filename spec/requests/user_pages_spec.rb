require 'spec_helper'

describe "User Pages" do

  subject {page}

	describe "edit" do

		let(:user) { FactoryGirl.create(:user) }

		describe "while logged in" do

			before do
				as_user(user)
				visit edit_user_registration_path(user)
			end

			describe "page" do
				it { should have_content("Edit") }
				it { should have_title("Edit user") }
			end
		end
	end
end