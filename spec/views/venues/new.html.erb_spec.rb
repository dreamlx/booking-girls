require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :address => "MyString",
      :contact => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_address[name=?]", "venue[address]"
      assert_select "input#venue_contact[name=?]", "venue[contact]"
      assert_select "textarea#venue_desc[name=?]", "venue[desc]"
    end
  end
end
