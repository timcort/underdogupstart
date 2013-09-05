require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

  	it "should have the content 'UnderdogUpstart'" do
  		visit root_path
  		expect(page).to have_content('Underdog Upstart')
  	end
  end
end
