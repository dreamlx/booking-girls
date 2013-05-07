require 'spec_helper'

describe "girls/show" do
  before(:each) do
    @girl = assign(:girl, stub_model(Girl,
      :name => "Name",
      :age => 1,
      :price => 2,
      :desc => "MyText",
      :bwh => "Bwh",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/Bwh/)
    rendered.should match(/State/)
  end
end
