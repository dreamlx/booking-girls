require 'spec_helper'

describe "service_menus/new" do
  before(:each) do
    assign(:service_menu, stub_model(ServiceMenu,
      :service_name => "MyString",
      :service_price => "9.99"
    ).as_new_record)
  end

  it "renders new service_menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", service_menus_path, "post" do
      assert_select "input#service_menu_service_name[name=?]", "service_menu[service_name]"
      assert_select "input#service_menu_service_price[name=?]", "service_menu[service_price]"
    end
  end
end
