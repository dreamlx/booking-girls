require 'spec_helper'

describe "menu_lists/index" do
  before(:each) do
    assign(:menu_lists, [
      stub_model(MenuList,
        :title => "Title",
        :desc => "MyText",
        :company => ""
      ),
      stub_model(MenuList,
        :title => "Title",
        :desc => "MyText",
        :company => ""
      )
    ])
  end

  it "renders a list of menu_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
