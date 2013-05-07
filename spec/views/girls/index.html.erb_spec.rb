require 'spec_helper'

describe "girls/index" do
  before(:each) do
    assign(:girls, [
      stub_model(Girl,
        :name => "Name",
        :age => 1,
        :price => 2,
        :desc => "MyText",
        :bwh => "Bwh",
        :state => "State"
      ),
      stub_model(Girl,
        :name => "Name",
        :age => 1,
        :price => 2,
        :desc => "MyText",
        :bwh => "Bwh",
        :state => "State"
      )
    ])
  end

  it "renders a list of girls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Bwh".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
