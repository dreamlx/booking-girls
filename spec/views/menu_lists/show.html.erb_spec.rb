require 'spec_helper'

describe "menu_lists/show" do
  before(:each) do
    @menu_list = assign(:menu_list, stub_model(MenuList,
      :title => "Title",
      :desc => "MyText",
      :company => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
