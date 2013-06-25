require 'spec_helper'

describe "service_menus/index" do
  before(:each) do
    assign(:service_menus, [
      stub_model(ServiceMenu,
        :service_name => "Service Name",
        :service_price => "9.99"
      ),
      stub_model(ServiceMenu,
        :service_name => "Service Name",
        :service_price => "9.99"
      )
    ])
  end

  it "renders a list of service_menus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Service Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
