require 'spec_helper'

describe "service_menus/show" do
  before(:each) do
    @service_menu = assign(:service_menu, stub_model(ServiceMenu,
      :service_name => "Service Name",
      :service_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Service Name/)
    rendered.should match(/9.99/)
  end
end
