require 'spec_helper'

describe "menu_lists/edit" do
  before(:each) do
    @menu_list = assign(:menu_list, stub_model(MenuList,
      :title => "MyString",
      :desc => "MyText",
      :company => ""
    ))
  end

  it "renders the edit menu_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_list_path(@menu_list), "post" do
      assert_select "input#menu_list_title[name=?]", "menu_list[title]"
      assert_select "textarea#menu_list_desc[name=?]", "menu_list[desc]"
      assert_select "input#menu_list_company[name=?]", "menu_list[company]"
    end
  end
end
