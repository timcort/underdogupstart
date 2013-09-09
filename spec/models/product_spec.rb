require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.create(:product) }
  before do 
  	@product = Product.new(title: "title", heading: "Heading", 
      sub_heading: "sub heading",
  		price: 7, 
  		demo_vid: '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>',
  		benefits: "lorem ipsum") 
  end

  subject { @product }

  it { should respond_to(:title) }
  it { should respond_to(:heading) }
  it { should respond_to(:sub_heading) }
  it { should respond_to(:price) }
  it { should respond_to(:demo_vid) }
  it { should respond_to(:benefits) }


  it { should be_valid }

  describe "when title is not present" do
  	before { @product.title = nil }
  	it { should_not be_valid }
  end

  describe "when heading is not present" do
    before { @product.heading = nil }
    it { should_not be_valid }
  end

  describe "when sub_heading is not present" do
  	before { @product.sub_heading = nil }
  	it { should_not be_valid }
  end

  describe "when price not present" do
  	before { @product.price = nil }
  	it { should_not be_valid }
  end

  describe "when demo vid not present" do
  	before { @product.demo_vid = nil }
  	it { should_not be_valid }
  end


  describe "when benefits are not present" do
  	before { @product.benefits = nil }
  	it { should_not be_valid }
  end

  # describe "product associations" do
  #   before { @product.save } 
  #   let!(:section_one) do
  #     FactoryGirl.create(:section, product: @product)
  #   end
  #   let!(:section_two) do
  #     FactoryGirl.create(:section, product: @product)
  #   end
  #   it "should destroy associated sections" do
  #     sections = @product.sections.to_a
  #     @product.destroy
  #     expect(sections).not_to be_empty
  #     sections.each do |section|
  #       expect(Section.where(id: section.id)).to be_empty
  #     end
  #   end
  # end
end