require 'spec_helper'

describe "menu_items/index" do
  before(:each) do
    assign(:menu_items, [
      stub_model(MenuItem,
        :title => "Title",
        :avatar => "Avatar",
        :price => "9.99",
        :desc => "MyText"
      ),
      stub_model(MenuItem,
        :title => "Title",
        :avatar => "Avatar",
        :price => "9.99",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
