require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :admin_id => 1
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_address[name=?]", "company[address]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_admin_id[name=?]", "company[admin_id]"
    end
  end
end
