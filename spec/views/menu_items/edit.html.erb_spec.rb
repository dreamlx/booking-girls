require 'spec_helper'

describe "menu_items/edit" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem,
      :title => "MyString",
      :avatar => "MyString",
      :price => "9.99",
      :desc => "MyText"
    ))
  end

  it "renders the edit menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_item_path(@menu_item), "post" do
      assert_select "input#menu_item_title[name=?]", "menu_item[title]"
      assert_select "input#menu_item_avatar[name=?]", "menu_item[avatar]"
      assert_select "input#menu_item_price[name=?]", "menu_item[price]"
      assert_select "textarea#menu_item_desc[name=?]", "menu_item[desc]"
    end
  end
end
