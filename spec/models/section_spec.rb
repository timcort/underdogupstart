require 'spec_helper'

describe Section do
  let(:product) { FactoryGirl.create(:product) }
  before do
  	@section = product.sections.build(product_id: product.id, sequence_no: 1, title: "example title",
  		description: "Lorem ipsum", 
  		video: '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>',
  		notes: "Lorem ipsum")
  end

  subject { @section }

  it { should respond_to(:product_id) }
  it { should respond_to(:sequence_no) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:video) }
  it { should respond_to(:notes) }

  it { should respond_to(:product) }
  its(:product) { should eq product }

  it { should be_valid }

  describe "when product_id is not present" do
    before { @section.product_id = nil }
    it { should_not be_valid }
  end

  describe "when sequence_no is not present" do
    before { @section.sequence_no = nil }
    it { should_not be_valid}
  end

  describe "when title is not present" do
    before { @section.title = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @section.description = " " }
    it { should_not be_valid }
  end

  describe "when video is not present" do
    before { @section.video = " " }
    it { should_not be_valid }
  end

  describe "when notes not present" do
    before { @section.notes = " " }
    it { should_not be_valid }
  end
end