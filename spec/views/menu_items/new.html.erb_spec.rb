require 'spec_helper'

describe "menu_items/new" do
  before(:each) do
    assign(:menu_item, stub_model(MenuItem,
      :title => "MyString",
      :avatar => "MyString",
      :price => "9.99",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_items_path, "post" do
      assert_select "input#menu_item_title[name=?]", "menu_item[title]"
      assert_select "input#menu_item_avatar[name=?]", "menu_item[avatar]"
      assert_select "input#menu_item_price[name=?]", "menu_item[price]"
      assert_select "textarea#menu_item_desc[name=?]", "menu_item[desc]"
    end
  end
end
