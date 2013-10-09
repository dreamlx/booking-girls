require 'spec_helper'

describe "menu_lists/new" do
  before(:each) do
    assign(:menu_list, stub_model(MenuList,
      :title => "MyString",
      :desc => "MyText",
      :company => ""
    ).as_new_record)
  end

  it "renders new menu_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_lists_path, "post" do
      assert_select "input#menu_list_title[name=?]", "menu_list[title]"
      assert_select "textarea#menu_list_desc[name=?]", "menu_list[desc]"
      assert_select "input#menu_list_company[name=?]", "menu_list[company]"
    end
  end
end
