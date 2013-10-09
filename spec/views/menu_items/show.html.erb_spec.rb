require 'spec_helper'

describe "menu_items/show" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem,
      :title => "Title",
      :avatar => "Avatar",
      :price => "9.99",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Avatar/)
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
  end
end
